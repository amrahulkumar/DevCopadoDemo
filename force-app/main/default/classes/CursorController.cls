/**
* @File Name : CursorController.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : May 30, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | May 30, 2025 |   | Initial Version
**/

public with sharing class CursorController {
    
    @AuraEnabled
    public static CursorResultWrapper processCursor(CursorResultWrapper wrapper){
        try {
            Database.Cursor cursorLocator;
            if(wrapper.stringlocator == null){
                cursorLocator = Database.getCursor('SELECT Id, Name FROM Contact');
            }else{
                cursorLocator = (Database.Cursor)JSON.deserializeStrict(wrapper.stringlocator, Database.Cursor.class);
            }
            wrapper.records = cursorLocator.fetch(wrapper.position, wrapper.batchSize);
            wrapper.stringlocator = JSON.serialize(cursorLocator);
            wrapper.position++;
            return wrapper;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class CursorResultWrapper{
        @auraEnabled 
        public Integer position{get;set;}
        @auraEnabled 
        public Integer batchSize{get;set;}
        @auraEnabled
        public List<Contact> records{get;set;}
        @auraEnabled
        public string stringlocator{get;set;}
    }
}