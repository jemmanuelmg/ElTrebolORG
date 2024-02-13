public without sharing class PrintInvoiceWithItemsController {
    public Invoice__c invoice {get; set;}
	public Id invoiceId {get; set;}
	public List<Invoice_Item__c> invoiceItems {get; set;}

	public PrintInvoiceWithItemsController() {
		
		this.invoiceId = ApexPages.currentPage().getParameters().get('id');

		this.invoiceItems = new List<Invoice_Item__c>();
		
		this.invoice = [
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
			Order__c,
			Total__c
			FROM Invoice__c 
			WHERE Id = :invoiceId
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
			Invoice__c,
			Product_Name__c,
			Sub_Total__c,
			Discount_Percentage__c
			FROM Invoice_Item__c 
			WHERE Invoice__c = :invoiceId
		];

	}
}