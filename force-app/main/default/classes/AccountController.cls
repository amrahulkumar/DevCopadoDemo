/**
* @File Name : AccountController.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : March 28, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | March 28, 2025 |   | Initial Version
**/

public class AccountController {
	@AuraEnabled (cacheable = true)
	public static List<Account> getAccounts(){
		return [select Id,Name,Industry,Rating,Website,AnnualRevenue from Account LIMIT 25];
	}
}