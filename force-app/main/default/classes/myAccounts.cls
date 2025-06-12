public with sharing class myAccounts {
    public static list<account> myAccounts() {

list<account> acc = [select Id,Name,Phone from Account limit 10];
return acc;

    }
}