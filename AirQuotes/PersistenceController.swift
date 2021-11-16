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
    
    func getQuoteById(id: NSManagedObjectID) -> Quote? {
        do {
            return try viewContext.existingObject(with: id) as? Quote
        } catch {
            return nil
        }
    }
    
    func getLatestQuotes() -> [Quote] {
        let request: NSFetchRequest<Quote> = Quote.fetchRequest()
        request.fetchLimit = 5
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
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
    

}

