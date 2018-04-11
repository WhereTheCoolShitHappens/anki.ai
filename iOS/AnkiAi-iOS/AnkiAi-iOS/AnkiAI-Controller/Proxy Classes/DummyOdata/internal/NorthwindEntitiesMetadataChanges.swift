// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

internal class NorthwindEntitiesMetadataChanges: ObjectBase {
    override init() {
    }

    class func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        NorthwindEntitiesMetadata.document = metadata
        NorthwindEntitiesMetadataChanges.merge1(metadata: metadata)
        try! NorthwindEntitiesFactory.registerAll()
    }

    private class func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct = metadata.entityType(withName: "NorthwindModel.Alphabetical_list_of_product")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.category.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.category = metadata.entityType(withName: "NorthwindModel.Category")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997 = metadata.entityType(withName: "NorthwindModel.Category_Sales_for_1997")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.currentProductList.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.currentProductList = metadata.entityType(withName: "NorthwindModel.Current_Product_List")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.customer.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.customer = metadata.entityType(withName: "NorthwindModel.Customer")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.customerDemographic.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.customerDemographic = metadata.entityType(withName: "NorthwindModel.CustomerDemographic")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity = metadata.entityType(withName: "NorthwindModel.Customer_and_Suppliers_by_City")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.employee.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.employee = metadata.entityType(withName: "NorthwindModel.Employee")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.invoice.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.invoice = metadata.entityType(withName: "NorthwindModel.Invoice")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.order.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.order = metadata.entityType(withName: "NorthwindModel.Order")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.orderDetail.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.orderDetail = metadata.entityType(withName: "NorthwindModel.Order_Detail")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended = metadata.entityType(withName: "NorthwindModel.Order_Details_Extended")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.orderSubtotal.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.orderSubtotal = metadata.entityType(withName: "NorthwindModel.Order_Subtotal")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.ordersQry.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.ordersQry = metadata.entityType(withName: "NorthwindModel.Orders_Qry")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.product.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.product = metadata.entityType(withName: "NorthwindModel.Product")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997 = metadata.entityType(withName: "NorthwindModel.Product_Sales_for_1997")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice = metadata.entityType(withName: "NorthwindModel.Products_Above_Average_Price")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.productsByCategory.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.productsByCategory = metadata.entityType(withName: "NorthwindModel.Products_by_Category")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.region.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.region = metadata.entityType(withName: "NorthwindModel.Region")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount = metadata.entityType(withName: "NorthwindModel.Sales_Totals_by_Amount")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.salesByCategory.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.salesByCategory = metadata.entityType(withName: "NorthwindModel.Sales_by_Category")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.shipper.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.shipper = metadata.entityType(withName: "NorthwindModel.Shipper")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter = metadata.entityType(withName: "NorthwindModel.Summary_of_Sales_by_Quarter")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear = metadata.entityType(withName: "NorthwindModel.Summary_of_Sales_by_Year")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.supplier.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.supplier = metadata.entityType(withName: "NorthwindModel.Supplier")
        }
        if !NorthwindEntitiesMetadata.EntityTypes.territory.isRemoved {
            NorthwindEntitiesMetadata.EntityTypes.territory = metadata.entityType(withName: "NorthwindModel.Territory")
        }
        if !NorthwindEntitiesMetadata.EntitySets.alphabeticalListOfProducts.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.alphabeticalListOfProducts = metadata.entitySet(withName: "Alphabetical_list_of_products")
        }
        if !NorthwindEntitiesMetadata.EntitySets.categories.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.categories = metadata.entitySet(withName: "Categories")
        }
        if !NorthwindEntitiesMetadata.EntitySets.categorySalesFor1997.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.categorySalesFor1997 = metadata.entitySet(withName: "Category_Sales_for_1997")
        }
        if !NorthwindEntitiesMetadata.EntitySets.currentProductLists.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.currentProductLists = metadata.entitySet(withName: "Current_Product_Lists")
        }
        if !NorthwindEntitiesMetadata.EntitySets.customerDemographics.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.customerDemographics = metadata.entitySet(withName: "CustomerDemographics")
        }
        if !NorthwindEntitiesMetadata.EntitySets.customerAndSuppliersByCities.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.customerAndSuppliersByCities = metadata.entitySet(withName: "Customer_and_Suppliers_by_Cities")
        }
        if !NorthwindEntitiesMetadata.EntitySets.customers.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.customers = metadata.entitySet(withName: "Customers")
        }
        if !NorthwindEntitiesMetadata.EntitySets.employees.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.employees = metadata.entitySet(withName: "Employees")
        }
        if !NorthwindEntitiesMetadata.EntitySets.invoices.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.invoices = metadata.entitySet(withName: "Invoices")
        }
        if !NorthwindEntitiesMetadata.EntitySets.orderDetails.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.orderDetails = metadata.entitySet(withName: "Order_Details")
        }
        if !NorthwindEntitiesMetadata.EntitySets.orderDetailsExtendeds.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.orderDetailsExtendeds = metadata.entitySet(withName: "Order_Details_Extendeds")
        }
        if !NorthwindEntitiesMetadata.EntitySets.orderSubtotals.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.orderSubtotals = metadata.entitySet(withName: "Order_Subtotals")
        }
        if !NorthwindEntitiesMetadata.EntitySets.orders.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.orders = metadata.entitySet(withName: "Orders")
        }
        if !NorthwindEntitiesMetadata.EntitySets.ordersQries.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.ordersQries = metadata.entitySet(withName: "Orders_Qries")
        }
        if !NorthwindEntitiesMetadata.EntitySets.productSalesFor1997.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.productSalesFor1997 = metadata.entitySet(withName: "Product_Sales_for_1997")
        }
        if !NorthwindEntitiesMetadata.EntitySets.products.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.products = metadata.entitySet(withName: "Products")
        }
        if !NorthwindEntitiesMetadata.EntitySets.productsAboveAveragePrices.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.productsAboveAveragePrices = metadata.entitySet(withName: "Products_Above_Average_Prices")
        }
        if !NorthwindEntitiesMetadata.EntitySets.productsByCategories.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.productsByCategories = metadata.entitySet(withName: "Products_by_Categories")
        }
        if !NorthwindEntitiesMetadata.EntitySets.regions.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.regions = metadata.entitySet(withName: "Regions")
        }
        if !NorthwindEntitiesMetadata.EntitySets.salesTotalsByAmounts.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.salesTotalsByAmounts = metadata.entitySet(withName: "Sales_Totals_by_Amounts")
        }
        if !NorthwindEntitiesMetadata.EntitySets.salesByCategories.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.salesByCategories = metadata.entitySet(withName: "Sales_by_Categories")
        }
        if !NorthwindEntitiesMetadata.EntitySets.shippers.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.shippers = metadata.entitySet(withName: "Shippers")
        }
        if !NorthwindEntitiesMetadata.EntitySets.summaryOfSalesByQuarters.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.summaryOfSalesByQuarters = metadata.entitySet(withName: "Summary_of_Sales_by_Quarters")
        }
        if !NorthwindEntitiesMetadata.EntitySets.summaryOfSalesByYears.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.summaryOfSalesByYears = metadata.entitySet(withName: "Summary_of_Sales_by_Years")
        }
        if !NorthwindEntitiesMetadata.EntitySets.suppliers.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.suppliers = metadata.entitySet(withName: "Suppliers")
        }
        if !NorthwindEntitiesMetadata.EntitySets.territories.isRemoved {
            NorthwindEntitiesMetadata.EntitySets.territories = metadata.entitySet(withName: "Territories")
        }
        if !AlphabeticalListOfProduct.productID.isRemoved {
            AlphabeticalListOfProduct.productID = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "ProductID")
        }
        if !AlphabeticalListOfProduct.productName.isRemoved {
            AlphabeticalListOfProduct.productName = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "ProductName")
        }
        if !AlphabeticalListOfProduct.supplierID.isRemoved {
            AlphabeticalListOfProduct.supplierID = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "SupplierID")
        }
        if !AlphabeticalListOfProduct.categoryID.isRemoved {
            AlphabeticalListOfProduct.categoryID = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "CategoryID")
        }
        if !AlphabeticalListOfProduct.quantityPerUnit.isRemoved {
            AlphabeticalListOfProduct.quantityPerUnit = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "QuantityPerUnit")
        }
        if !AlphabeticalListOfProduct.unitPrice.isRemoved {
            AlphabeticalListOfProduct.unitPrice = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "UnitPrice")
        }
        if !AlphabeticalListOfProduct.unitsInStock.isRemoved {
            AlphabeticalListOfProduct.unitsInStock = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "UnitsInStock")
        }
        if !AlphabeticalListOfProduct.unitsOnOrder.isRemoved {
            AlphabeticalListOfProduct.unitsOnOrder = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "UnitsOnOrder")
        }
        if !AlphabeticalListOfProduct.reorderLevel.isRemoved {
            AlphabeticalListOfProduct.reorderLevel = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "ReorderLevel")
        }
        if !AlphabeticalListOfProduct.discontinued.isRemoved {
            AlphabeticalListOfProduct.discontinued = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "Discontinued")
        }
        if !AlphabeticalListOfProduct.categoryName.isRemoved {
            AlphabeticalListOfProduct.categoryName = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "CategoryName")
        }
        if !Category.categoryID.isRemoved {
            Category.categoryID = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "CategoryID")
        }
        if !Category.categoryName.isRemoved {
            Category.categoryName = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "CategoryName")
        }
        if !Category.description.isRemoved {
            Category.description = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "Description")
        }
        if !Category.picture.isRemoved {
            Category.picture = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "Picture")
        }
        if !Category.products.isRemoved {
            Category.products = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "Products")
        }
        if !CategorySalesFor1997.categoryName.isRemoved {
            CategorySalesFor1997.categoryName = NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997.property(withName: "CategoryName")
        }
        if !CategorySalesFor1997.categorySales.isRemoved {
            CategorySalesFor1997.categorySales = NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997.property(withName: "CategorySales")
        }
        if !CurrentProductList.productID.isRemoved {
            CurrentProductList.productID = NorthwindEntitiesMetadata.EntityTypes.currentProductList.property(withName: "ProductID")
        }
        if !CurrentProductList.productName.isRemoved {
            CurrentProductList.productName = NorthwindEntitiesMetadata.EntityTypes.currentProductList.property(withName: "ProductName")
        }
        if !Customer.customerID.isRemoved {
            Customer.customerID = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "CustomerID")
        }
        if !Customer.companyName.isRemoved {
            Customer.companyName = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "CompanyName")
        }
        if !Customer.contactName.isRemoved {
            Customer.contactName = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "ContactName")
        }
        if !Customer.contactTitle.isRemoved {
            Customer.contactTitle = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "ContactTitle")
        }
        if !Customer.address.isRemoved {
            Customer.address = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Address")
        }
        if !Customer.city.isRemoved {
            Customer.city = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "City")
        }
        if !Customer.region.isRemoved {
            Customer.region = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Region")
        }
        if !Customer.postalCode.isRemoved {
            Customer.postalCode = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "PostalCode")
        }
        if !Customer.country.isRemoved {
            Customer.country = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Country")
        }
        if !Customer.phone.isRemoved {
            Customer.phone = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Phone")
        }
        if !Customer.fax.isRemoved {
            Customer.fax = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Fax")
        }
        if !Customer.orders.isRemoved {
            Customer.orders = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Orders")
        }
        if !Customer.customerDemographics.isRemoved {
            Customer.customerDemographics = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "CustomerDemographics")
        }
        if !CustomerDemographic.customerTypeID.isRemoved {
            CustomerDemographic.customerTypeID = NorthwindEntitiesMetadata.EntityTypes.customerDemographic.property(withName: "CustomerTypeID")
        }
        if !CustomerDemographic.customerDesc.isRemoved {
            CustomerDemographic.customerDesc = NorthwindEntitiesMetadata.EntityTypes.customerDemographic.property(withName: "CustomerDesc")
        }
        if !CustomerDemographic.customers.isRemoved {
            CustomerDemographic.customers = NorthwindEntitiesMetadata.EntityTypes.customerDemographic.property(withName: "Customers")
        }
        if !CustomerAndSuppliersByCity.city.isRemoved {
            CustomerAndSuppliersByCity.city = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "City")
        }
        if !CustomerAndSuppliersByCity.companyName.isRemoved {
            CustomerAndSuppliersByCity.companyName = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "CompanyName")
        }
        if !CustomerAndSuppliersByCity.contactName.isRemoved {
            CustomerAndSuppliersByCity.contactName = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "ContactName")
        }
        if !CustomerAndSuppliersByCity.relationship.isRemoved {
            CustomerAndSuppliersByCity.relationship = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "Relationship")
        }
        if !Employee.employeeID.isRemoved {
            Employee.employeeID = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "EmployeeID")
        }
        if !Employee.lastName.isRemoved {
            Employee.lastName = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "LastName")
        }
        if !Employee.firstName.isRemoved {
            Employee.firstName = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "FirstName")
        }
        if !Employee.title.isRemoved {
            Employee.title = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Title")
        }
        if !Employee.titleOfCourtesy.isRemoved {
            Employee.titleOfCourtesy = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "TitleOfCourtesy")
        }
        if !Employee.birthDate.isRemoved {
            Employee.birthDate = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "BirthDate")
        }
        if !Employee.hireDate.isRemoved {
            Employee.hireDate = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "HireDate")
        }
        if !Employee.address.isRemoved {
            Employee.address = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Address")
        }
        if !Employee.city.isRemoved {
            Employee.city = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "City")
        }
        if !Employee.region.isRemoved {
            Employee.region = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Region")
        }
        if !Employee.postalCode.isRemoved {
            Employee.postalCode = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "PostalCode")
        }
        if !Employee.country.isRemoved {
            Employee.country = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Country")
        }
        if !Employee.homePhone.isRemoved {
            Employee.homePhone = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "HomePhone")
        }
        if !Employee.extension.isRemoved {
            Employee.extension = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Extension")
        }
        if !Employee.photo.isRemoved {
            Employee.photo = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Photo")
        }
        if !Employee.notes.isRemoved {
            Employee.notes = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Notes")
        }
        if !Employee.reportsTo.isRemoved {
            Employee.reportsTo = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "ReportsTo")
        }
        if !Employee.photoPath.isRemoved {
            Employee.photoPath = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "PhotoPath")
        }
        if !Employee.employees1.isRemoved {
            Employee.employees1 = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Employees1")
        }
        if !Employee.employee1.isRemoved {
            Employee.employee1 = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Employee1")
        }
        if !Employee.orders.isRemoved {
            Employee.orders = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Orders")
        }
        if !Employee.territories.isRemoved {
            Employee.territories = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Territories")
        }
        if !Invoice.shipName.isRemoved {
            Invoice.shipName = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipName")
        }
        if !Invoice.shipAddress.isRemoved {
            Invoice.shipAddress = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipAddress")
        }
        if !Invoice.shipCity.isRemoved {
            Invoice.shipCity = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipCity")
        }
        if !Invoice.shipRegion.isRemoved {
            Invoice.shipRegion = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipRegion")
        }
        if !Invoice.shipPostalCode.isRemoved {
            Invoice.shipPostalCode = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipPostalCode")
        }
        if !Invoice.shipCountry.isRemoved {
            Invoice.shipCountry = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipCountry")
        }
        if !Invoice.customerID.isRemoved {
            Invoice.customerID = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "CustomerID")
        }
        if !Invoice.customerName.isRemoved {
            Invoice.customerName = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "CustomerName")
        }
        if !Invoice.address.isRemoved {
            Invoice.address = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Address")
        }
        if !Invoice.city.isRemoved {
            Invoice.city = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "City")
        }
        if !Invoice.region.isRemoved {
            Invoice.region = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Region")
        }
        if !Invoice.postalCode.isRemoved {
            Invoice.postalCode = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "PostalCode")
        }
        if !Invoice.country.isRemoved {
            Invoice.country = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Country")
        }
        if !Invoice.salesperson.isRemoved {
            Invoice.salesperson = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Salesperson")
        }
        if !Invoice.orderID.isRemoved {
            Invoice.orderID = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "OrderID")
        }
        if !Invoice.orderDate.isRemoved {
            Invoice.orderDate = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "OrderDate")
        }
        if !Invoice.requiredDate.isRemoved {
            Invoice.requiredDate = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "RequiredDate")
        }
        if !Invoice.shippedDate.isRemoved {
            Invoice.shippedDate = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShippedDate")
        }
        if !Invoice.shipperName.isRemoved {
            Invoice.shipperName = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipperName")
        }
        if !Invoice.productID.isRemoved {
            Invoice.productID = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ProductID")
        }
        if !Invoice.productName.isRemoved {
            Invoice.productName = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ProductName")
        }
        if !Invoice.unitPrice.isRemoved {
            Invoice.unitPrice = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "UnitPrice")
        }
        if !Invoice.quantity.isRemoved {
            Invoice.quantity = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Quantity")
        }
        if !Invoice.discount.isRemoved {
            Invoice.discount = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Discount")
        }
        if !Invoice.extendedPrice.isRemoved {
            Invoice.extendedPrice = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ExtendedPrice")
        }
        if !Invoice.freight.isRemoved {
            Invoice.freight = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Freight")
        }
        if !Order.orderID.isRemoved {
            Order.orderID = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "OrderID")
        }
        if !Order.customerID.isRemoved {
            Order.customerID = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "CustomerID")
        }
        if !Order.employeeID.isRemoved {
            Order.employeeID = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "EmployeeID")
        }
        if !Order.orderDate.isRemoved {
            Order.orderDate = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "OrderDate")
        }
        if !Order.requiredDate.isRemoved {
            Order.requiredDate = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "RequiredDate")
        }
        if !Order.shippedDate.isRemoved {
            Order.shippedDate = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShippedDate")
        }
        if !Order.shipVia.isRemoved {
            Order.shipVia = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipVia")
        }
        if !Order.freight.isRemoved {
            Order.freight = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Freight")
        }
        if !Order.shipName.isRemoved {
            Order.shipName = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipName")
        }
        if !Order.shipAddress.isRemoved {
            Order.shipAddress = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipAddress")
        }
        if !Order.shipCity.isRemoved {
            Order.shipCity = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipCity")
        }
        if !Order.shipRegion.isRemoved {
            Order.shipRegion = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipRegion")
        }
        if !Order.shipPostalCode.isRemoved {
            Order.shipPostalCode = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipPostalCode")
        }
        if !Order.shipCountry.isRemoved {
            Order.shipCountry = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipCountry")
        }
        if !Order.customer.isRemoved {
            Order.customer = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Customer")
        }
        if !Order.employee.isRemoved {
            Order.employee = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Employee")
        }
        if !Order.orderDetails.isRemoved {
            Order.orderDetails = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Order_Details")
        }
        if !Order.shipper.isRemoved {
            Order.shipper = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Shipper")
        }
        if !OrderDetail.orderID.isRemoved {
            OrderDetail.orderID = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "OrderID")
        }
        if !OrderDetail.productID.isRemoved {
            OrderDetail.productID = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "ProductID")
        }
        if !OrderDetail.unitPrice.isRemoved {
            OrderDetail.unitPrice = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "UnitPrice")
        }
        if !OrderDetail.quantity.isRemoved {
            OrderDetail.quantity = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Quantity")
        }
        if !OrderDetail.discount.isRemoved {
            OrderDetail.discount = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Discount")
        }
        if !OrderDetail.order.isRemoved {
            OrderDetail.order = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Order")
        }
        if !OrderDetail.product.isRemoved {
            OrderDetail.product = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Product")
        }
        if !OrderDetailsExtended.orderID.isRemoved {
            OrderDetailsExtended.orderID = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "OrderID")
        }
        if !OrderDetailsExtended.productID.isRemoved {
            OrderDetailsExtended.productID = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "ProductID")
        }
        if !OrderDetailsExtended.productName.isRemoved {
            OrderDetailsExtended.productName = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "ProductName")
        }
        if !OrderDetailsExtended.unitPrice.isRemoved {
            OrderDetailsExtended.unitPrice = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "UnitPrice")
        }
        if !OrderDetailsExtended.quantity.isRemoved {
            OrderDetailsExtended.quantity = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "Quantity")
        }
        if !OrderDetailsExtended.discount.isRemoved {
            OrderDetailsExtended.discount = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "Discount")
        }
        if !OrderDetailsExtended.extendedPrice.isRemoved {
            OrderDetailsExtended.extendedPrice = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "ExtendedPrice")
        }
        if !OrderSubtotal.orderID.isRemoved {
            OrderSubtotal.orderID = NorthwindEntitiesMetadata.EntityTypes.orderSubtotal.property(withName: "OrderID")
        }
        if !OrderSubtotal.subtotal.isRemoved {
            OrderSubtotal.subtotal = NorthwindEntitiesMetadata.EntityTypes.orderSubtotal.property(withName: "Subtotal")
        }
        if !OrdersQry.orderID.isRemoved {
            OrdersQry.orderID = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "OrderID")
        }
        if !OrdersQry.customerID.isRemoved {
            OrdersQry.customerID = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "CustomerID")
        }
        if !OrdersQry.employeeID.isRemoved {
            OrdersQry.employeeID = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "EmployeeID")
        }
        if !OrdersQry.orderDate.isRemoved {
            OrdersQry.orderDate = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "OrderDate")
        }
        if !OrdersQry.requiredDate.isRemoved {
            OrdersQry.requiredDate = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "RequiredDate")
        }
        if !OrdersQry.shippedDate.isRemoved {
            OrdersQry.shippedDate = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShippedDate")
        }
        if !OrdersQry.shipVia.isRemoved {
            OrdersQry.shipVia = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipVia")
        }
        if !OrdersQry.freight.isRemoved {
            OrdersQry.freight = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Freight")
        }
        if !OrdersQry.shipName.isRemoved {
            OrdersQry.shipName = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipName")
        }
        if !OrdersQry.shipAddress.isRemoved {
            OrdersQry.shipAddress = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipAddress")
        }
        if !OrdersQry.shipCity.isRemoved {
            OrdersQry.shipCity = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipCity")
        }
        if !OrdersQry.shipRegion.isRemoved {
            OrdersQry.shipRegion = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipRegion")
        }
        if !OrdersQry.shipPostalCode.isRemoved {
            OrdersQry.shipPostalCode = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipPostalCode")
        }
        if !OrdersQry.shipCountry.isRemoved {
            OrdersQry.shipCountry = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipCountry")
        }
        if !OrdersQry.companyName.isRemoved {
            OrdersQry.companyName = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "CompanyName")
        }
        if !OrdersQry.address.isRemoved {
            OrdersQry.address = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Address")
        }
        if !OrdersQry.city.isRemoved {
            OrdersQry.city = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "City")
        }
        if !OrdersQry.region.isRemoved {
            OrdersQry.region = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Region")
        }
        if !OrdersQry.postalCode.isRemoved {
            OrdersQry.postalCode = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "PostalCode")
        }
        if !OrdersQry.country.isRemoved {
            OrdersQry.country = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Country")
        }
        if !Product.productID.isRemoved {
            Product.productID = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "ProductID")
        }
        if !Product.productName.isRemoved {
            Product.productName = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "ProductName")
        }
        if !Product.supplierID.isRemoved {
            Product.supplierID = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "SupplierID")
        }
        if !Product.categoryID.isRemoved {
            Product.categoryID = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "CategoryID")
        }
        if !Product.quantityPerUnit.isRemoved {
            Product.quantityPerUnit = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "QuantityPerUnit")
        }
        if !Product.unitPrice.isRemoved {
            Product.unitPrice = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "UnitPrice")
        }
        if !Product.unitsInStock.isRemoved {
            Product.unitsInStock = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "UnitsInStock")
        }
        if !Product.unitsOnOrder.isRemoved {
            Product.unitsOnOrder = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "UnitsOnOrder")
        }
        if !Product.reorderLevel.isRemoved {
            Product.reorderLevel = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "ReorderLevel")
        }
        if !Product.discontinued.isRemoved {
            Product.discontinued = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Discontinued")
        }
        if !Product.category.isRemoved {
            Product.category = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Category")
        }
        if !Product.orderDetails.isRemoved {
            Product.orderDetails = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Order_Details")
        }
        if !Product.supplier.isRemoved {
            Product.supplier = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Supplier")
        }
        if !ProductSalesFor1997.categoryName.isRemoved {
            ProductSalesFor1997.categoryName = NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.property(withName: "CategoryName")
        }
        if !ProductSalesFor1997.productName.isRemoved {
            ProductSalesFor1997.productName = NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.property(withName: "ProductName")
        }
        if !ProductSalesFor1997.productSales.isRemoved {
            ProductSalesFor1997.productSales = NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.property(withName: "ProductSales")
        }
        if !ProductsAboveAveragePrice.productName.isRemoved {
            ProductsAboveAveragePrice.productName = NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice.property(withName: "ProductName")
        }
        if !ProductsAboveAveragePrice.unitPrice.isRemoved {
            ProductsAboveAveragePrice.unitPrice = NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice.property(withName: "UnitPrice")
        }
        if !ProductsByCategory.categoryName.isRemoved {
            ProductsByCategory.categoryName = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "CategoryName")
        }
        if !ProductsByCategory.productName.isRemoved {
            ProductsByCategory.productName = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "ProductName")
        }
        if !ProductsByCategory.quantityPerUnit.isRemoved {
            ProductsByCategory.quantityPerUnit = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "QuantityPerUnit")
        }
        if !ProductsByCategory.unitsInStock.isRemoved {
            ProductsByCategory.unitsInStock = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "UnitsInStock")
        }
        if !ProductsByCategory.discontinued.isRemoved {
            ProductsByCategory.discontinued = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "Discontinued")
        }
        if !Region.regionID.isRemoved {
            Region.regionID = NorthwindEntitiesMetadata.EntityTypes.region.property(withName: "RegionID")
        }
        if !Region.regionDescription.isRemoved {
            Region.regionDescription = NorthwindEntitiesMetadata.EntityTypes.region.property(withName: "RegionDescription")
        }
        if !Region.territories.isRemoved {
            Region.territories = NorthwindEntitiesMetadata.EntityTypes.region.property(withName: "Territories")
        }
        if !SalesTotalsByAmount.saleAmount.isRemoved {
            SalesTotalsByAmount.saleAmount = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "SaleAmount")
        }
        if !SalesTotalsByAmount.orderID.isRemoved {
            SalesTotalsByAmount.orderID = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "OrderID")
        }
        if !SalesTotalsByAmount.companyName.isRemoved {
            SalesTotalsByAmount.companyName = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "CompanyName")
        }
        if !SalesTotalsByAmount.shippedDate.isRemoved {
            SalesTotalsByAmount.shippedDate = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "ShippedDate")
        }
        if !SalesByCategory.categoryID.isRemoved {
            SalesByCategory.categoryID = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "CategoryID")
        }
        if !SalesByCategory.categoryName.isRemoved {
            SalesByCategory.categoryName = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "CategoryName")
        }
        if !SalesByCategory.productName.isRemoved {
            SalesByCategory.productName = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "ProductName")
        }
        if !SalesByCategory.productSales.isRemoved {
            SalesByCategory.productSales = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "ProductSales")
        }
        if !Shipper.shipperID.isRemoved {
            Shipper.shipperID = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "ShipperID")
        }
        if !Shipper.companyName.isRemoved {
            Shipper.companyName = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "CompanyName")
        }
        if !Shipper.phone.isRemoved {
            Shipper.phone = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "Phone")
        }
        if !Shipper.orders.isRemoved {
            Shipper.orders = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "Orders")
        }
        if !SummaryOfSalesByQuarter.shippedDate.isRemoved {
            SummaryOfSalesByQuarter.shippedDate = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.property(withName: "ShippedDate")
        }
        if !SummaryOfSalesByQuarter.orderID.isRemoved {
            SummaryOfSalesByQuarter.orderID = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.property(withName: "OrderID")
        }
        if !SummaryOfSalesByQuarter.subtotal.isRemoved {
            SummaryOfSalesByQuarter.subtotal = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.property(withName: "Subtotal")
        }
        if !SummaryOfSalesByYear.shippedDate.isRemoved {
            SummaryOfSalesByYear.shippedDate = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.property(withName: "ShippedDate")
        }
        if !SummaryOfSalesByYear.orderID.isRemoved {
            SummaryOfSalesByYear.orderID = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.property(withName: "OrderID")
        }
        if !SummaryOfSalesByYear.subtotal.isRemoved {
            SummaryOfSalesByYear.subtotal = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.property(withName: "Subtotal")
        }
        if !Supplier.supplierID.isRemoved {
            Supplier.supplierID = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "SupplierID")
        }
        if !Supplier.companyName.isRemoved {
            Supplier.companyName = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "CompanyName")
        }
        if !Supplier.contactName.isRemoved {
            Supplier.contactName = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactName")
        }
        if !Supplier.contactTitle.isRemoved {
            Supplier.contactTitle = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactTitle")
        }
        if !Supplier.address.isRemoved {
            Supplier.address = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Address")
        }
        if !Supplier.city.isRemoved {
            Supplier.city = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "City")
        }
        if !Supplier.region.isRemoved {
            Supplier.region = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Region")
        }
        if !Supplier.postalCode.isRemoved {
            Supplier.postalCode = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "PostalCode")
        }
        if !Supplier.country.isRemoved {
            Supplier.country = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Country")
        }
        if !Supplier.phone.isRemoved {
            Supplier.phone = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Phone")
        }
        if !Supplier.fax.isRemoved {
            Supplier.fax = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Fax")
        }
        if !Supplier.homePage.isRemoved {
            Supplier.homePage = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "HomePage")
        }
        if !Supplier.products.isRemoved {
            Supplier.products = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Products")
        }
        if !Territory.territoryID.isRemoved {
            Territory.territoryID = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "TerritoryID")
        }
        if !Territory.territoryDescription.isRemoved {
            Territory.territoryDescription = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "TerritoryDescription")
        }
        if !Territory.regionID.isRemoved {
            Territory.regionID = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "RegionID")
        }
        if !Territory.region.isRemoved {
            Territory.region = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "Region")
        }
        if !Territory.employees.isRemoved {
            Territory.employees = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "Employees")
        }
    }
}
