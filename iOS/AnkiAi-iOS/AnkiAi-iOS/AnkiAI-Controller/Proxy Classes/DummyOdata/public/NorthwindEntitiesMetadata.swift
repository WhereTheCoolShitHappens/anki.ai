// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

public class NorthwindEntitiesMetadata {
    public static var document: CSDLDocument = NorthwindEntitiesMetadata.resolve()

    private static func resolve() -> CSDLDocument {
        try! NorthwindEntitiesFactory.registerAll()
        NorthwindEntitiesMetadataParser.parsed.hasGeneratedProxies = true
        return NorthwindEntitiesMetadataParser.parsed
    }

    public class EntityTypes {
        public static var alphabeticalListOfProduct: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Alphabetical_list_of_product")

        public static var category: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Category")

        public static var categorySalesFor1997: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Category_Sales_for_1997")

        public static var currentProductList: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Current_Product_List")

        public static var customer: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Customer")

        public static var customerDemographic: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.CustomerDemographic")

        public static var customerAndSuppliersByCity: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Customer_and_Suppliers_by_City")

        public static var employee: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Employee")

        public static var invoice: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Invoice")

        public static var order: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Order")

        public static var orderDetail: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Order_Detail")

        public static var orderDetailsExtended: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Order_Details_Extended")

        public static var orderSubtotal: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Order_Subtotal")

        public static var ordersQry: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Orders_Qry")

        public static var product: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Product")

        public static var productSalesFor1997: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Product_Sales_for_1997")

        public static var productsAboveAveragePrice: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Products_Above_Average_Price")

        public static var productsByCategory: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Products_by_Category")

        public static var region: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Region")

        public static var salesTotalsByAmount: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Sales_Totals_by_Amount")

        public static var salesByCategory: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Sales_by_Category")

        public static var shipper: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Shipper")

        public static var summaryOfSalesByQuarter: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Summary_of_Sales_by_Quarter")

        public static var summaryOfSalesByYear: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Summary_of_Sales_by_Year")

        public static var supplier: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Supplier")

        public static var territory: EntityType = NorthwindEntitiesMetadataParser.parsed.entityType(withName: "NorthwindModel.Territory")
    }

    public class EntitySets {
        public static var alphabeticalListOfProducts: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Alphabetical_list_of_products")

        public static var categories: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Categories")

        public static var categorySalesFor1997: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Category_Sales_for_1997")

        public static var currentProductLists: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Current_Product_Lists")

        public static var customerDemographics: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "CustomerDemographics")

        public static var customerAndSuppliersByCities: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Customer_and_Suppliers_by_Cities")

        public static var customers: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Customers")

        public static var employees: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Employees")

        public static var invoices: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Invoices")

        public static var orderDetails: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Order_Details")

        public static var orderDetailsExtendeds: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Order_Details_Extendeds")

        public static var orderSubtotals: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Order_Subtotals")

        public static var orders: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Orders")

        public static var ordersQries: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Orders_Qries")

        public static var productSalesFor1997: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Product_Sales_for_1997")

        public static var products: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Products")

        public static var productsAboveAveragePrices: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Products_Above_Average_Prices")

        public static var productsByCategories: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Products_by_Categories")

        public static var regions: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Regions")

        public static var salesTotalsByAmounts: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Sales_Totals_by_Amounts")

        public static var salesByCategories: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Sales_by_Categories")

        public static var shippers: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Shippers")

        public static var summaryOfSalesByQuarters: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Summary_of_Sales_by_Quarters")

        public static var summaryOfSalesByYears: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Summary_of_Sales_by_Years")

        public static var suppliers: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Suppliers")

        public static var territories: EntitySet = NorthwindEntitiesMetadataParser.parsed.entitySet(withName: "Territories")
    }
}
