//
//  File.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 16/11/21.
//

import Foundation
import CoreData


// Si occupa di inizializzare CoreData e di tutte le operazioni che lo riguardano
final class PersistenceController {
    
    let container: NSPersistentContainer
    static let shared = PersistenceController()
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    // Rendo privata la funzione di inizializzazione, così facendo non sarà possibile instanziare questa classe
    // Ho reso questa classe un "Singleton". Una sola instanza di essa esiste ed è accessibile tramite la propria proprietà statica che vedete sopra "shared".
    private init() {
        // Il nome che passo è il nome del file AirQuotesModel che vedete nel file explorer
        // Il model si crea con File -> New -> File... -> Data Model
        container = NSPersistentContainer(name: "AirQuotesModel")
        
        // Qui inizializzo CoreData
        container.loadPersistentStores { _, error in
            // Se error non è nil allora significa che qualcosa è andato storto nell'inizializzazione di CoreData, quindi crassho l'app con fatalError.
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error.localizedDescription)")
            }
        }
    }
    
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try viewContext.save()
            } catch {
                viewContext.rollback()
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Quotes Data Functions
    
    func createQuote(_ text: String, _ by: String, _ book: Book, _ tags: [Tag]) {
        let newQuote = Quote(context: viewContext)
        newQuote.id = UUID()
        newQuote.text = text
        newQuote.author = by
        newQuote.book = book
        newQuote.tags = NSSet(array: tags)
        newQuote.createdAt = Date()
        save()
    }
    
    func setFavoriteQuote(quote: Quote) {
        quote.isFavorite = true
        save()
    }
    
    func unfavoriteQuote(quote: Quote) {
        quote.isFavorite = false
        save()
    }
    
    func getQuoteById(id: NSManagedObjectID) -> Quote? {
        do {
            return try viewContext.existingObject(with: id) as? Quote
        } catch {
            return nil
        }
    }
    
    func getLatestQuotes() -> NSFetchRequest<Quote> {
        let request = Quote.fetchRequest()
        request.fetchLimit = 5
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Quote.createdAt, ascending: false)
        ]
        
        return request
    }
    
    func delete(quote: Quote) {
        viewContext.delete(quote)
        save()
    }
    
    // MARK: - Tags Data Functions

    func getTags() -> [Tag] {
        let request: NSFetchRequest<Tag> = Tag.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func delete(tag: Tag) {
        viewContext.delete(tag)
        save()
    }
    
    
    
    func getTagsQuotes(_ tag: Tag) -> [Quote]? {
        let fetchRequest = Quote.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ANY tag == %@", tag)
        if let quotes = try? viewContext.fetch(fetchRequest) {
            return quotes
        }
        return nil
    }
    
    
    // MARK: - Books Data Functions
    
    func getBooksQuotes(_ book: Book) -> [Quote]? {
        let fetchRequest = Quote.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ANY book == %@", book)
        if let quotes = try? viewContext.fetch(fetchRequest) {
            return quotes
        }
        return nil
    }
    
    
    
    
    
    
    
    
    func createBook(_ color: String, _ title: String, _ author: String) {
        let newBook = Book(context: viewContext)
        newBook.color = color
        newBook.id = UUID()
        newBook.title = title
        newBook.author = author
        newBook.createdAt = Date()
        newBook.updatedAt = Date()
        save()
    }
    
    func delete(book: Book) {
        viewContext.delete(book)
        save()
    }
    
    func getBookById(id: NSManagedObjectID) -> Book? {
        do {
            return try viewContext.existingObject(with: id) as? Book
        } catch {
            return nil
        }
    }
    
    func updateBook(_ bookToUpdate: Book, _ color: String, _ title: String, _ author: String) {
        bookToUpdate.setValuesForKeys([
            "color": color,
            "title": title,
            "author": author,
            "updatedAt": Date()
        ])
        save()
    }
    
    // MARK: - Tags Data Functions
    
    func createTag(_ color: String, _ name: String) -> Tag {
        
        let fetchRequest = Tag.fetchRequest()

        fetchRequest.predicate = NSPredicate(
            format: "name = %@", name
        )

        if let tags = try? viewContext.fetch(fetchRequest) {
            if !tags.isEmpty {
                let existingTag = tags[0]
                existingTag.setValue(color, forKey: "color")
                save()
                return existingTag
            }
        }

        let newTag = Tag(context: viewContext)
        newTag.id = UUID()
        newTag.color = color
        newTag.name = name
        save()
                
        return newTag
    }
}

