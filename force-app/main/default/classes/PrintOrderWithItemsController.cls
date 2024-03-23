public without sharing class PrintOrderWithItemsController {
    public Order__c order {get; set;}
	public Id orderId {get; set;}
	public List<Invoice_Item__c> invoiceItems {get; set;}

	public PrintOrderWithItemsController() {
		
		this.orderId = ApexPages.currentPage().getParameters().get('id');

		this.invoiceItems = new List<Invoice_Item__c>();
		
		this.order = [
			SELECT 
			Id,
			OwnerId,
			IsDeleted,
			Name,
			CreatedDate,
			CreatedById,
			LastModifiedDate,
			LastModifiedById,
			SystemModstamp,
			LastActivityDate,
			LastViewedDate,
			LastReferencedDate,
			Total__c
			FROM Order__c 
			WHERE Id = :orderId
		];

		this.invoiceItems = [
			SELECT 
			Id,
			IsDeleted,
			Name,
			CreatedDate,
			CreatedById,
			LastModifiedDate,
			LastModifiedById,
			SystemModstamp,
			LastActivityDate,
			LastViewedDate,
			LastReferencedDate,
			Quantity__c,
			Unit_Price__c,
			Discount_Amount__c,
			Product__c,
			Order__c,
			Product_Name__c,
			Sub_Total__c,
			Discount_Percentage__c
			FROM Invoice_Item__c 
			WHERE Order__c = :orderId
		];

	}
}