public class FileDownloadController {
    @AuraEnabled
    public static String getFileDownloadUrl(String contentDocumentId) {
        contentDocumentId = '0695g00000HuSvrAAF';
        List<ContentVersion> contentVersions = [Select Id from ContentVersion where ContentDocumentID =:contentDocumentId LIMIT 1 ];
        String contentVersionId = contentVersions[0].Id;
        return '/sfc/servlet.shepherd/version/download/' + contentVersionId;
    }
}