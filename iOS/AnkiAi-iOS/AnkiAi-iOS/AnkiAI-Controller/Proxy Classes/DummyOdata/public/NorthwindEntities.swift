// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class NorthwindEntities<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = NorthwindEntitiesMetadata.document
    }

    @available(swift, deprecated: 4.0, renamed: "fetchAlphabeticalListOfProducts")
    open func alphabeticalListOfProducts(query: DataQuery = DataQuery()) throws -> Array<AlphabeticalListOfProduct> {
        return try self.fetchAlphabeticalListOfProducts(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchAlphabeticalListOfProducts")
    open func alphabeticalListOfProducts(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<AlphabeticalListOfProduct>?, Error?) -> Void) {
        self.fetchAlphabeticalListOfProducts(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCategories")
    open func categories(query: DataQuery = DataQuery()) throws -> Array<Category> {
        return try self.fetchCategories(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCategories")
    open func categories(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Category>?, Error?) -> Void) {
        self.fetchCategories(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCategorySalesFor1997")
    open func categorySalesFor1997(query: DataQuery = DataQuery()) throws -> Array<CategorySalesFor1997> {
        return try self.fetchCategorySalesFor1997(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCategorySalesFor1997")
    open func categorySalesFor1997(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<CategorySalesFor1997>?, Error?) -> Void) {
        self.fetchCategorySalesFor1997(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCurrentProductLists")
    open func currentProductLists(query: DataQuery = DataQuery()) throws -> Array<CurrentProductList> {
        return try self.fetchCurrentProductLists(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCurrentProductLists")
    open func currentProductLists(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<CurrentProductList>?, Error?) -> Void) {
        self.fetchCurrentProductLists(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCustomerAndSuppliersByCities")
    open func customerAndSuppliersByCities(query: DataQuery = DataQuery()) throws -> Array<CustomerAndSuppliersByCity> {
        return try self.fetchCustomerAndSuppliersByCities(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCustomerAndSuppliersByCities")
    open func customerAndSuppliersByCities(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<CustomerAndSuppliersByCity>?, Error?) -> Void) {
        self.fetchCustomerAndSuppliersByCities(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCustomerDemographics")
    open func customerDemographics(query: DataQuery = DataQuery()) throws -> Array<CustomerDemographic> {
        return try self.fetchCustomerDemographics(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCustomerDemographics")
    open func customerDemographics(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<CustomerDemographic>?, Error?) -> Void) {
        self.fetchCustomerDemographics(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCustomers")
    open func customers(query: DataQuery = DataQuery()) throws -> Array<Customer> {
        return try self.fetchCustomers(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCustomers")
    open func customers(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Customer>?, Error?) -> Void) {
        self.fetchCustomers(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchEmployees")
    open func employees(query: DataQuery = DataQuery()) throws -> Array<Employee> {
        return try self.fetchEmployees(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchEmployees")
    open func employees(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Employee>?, Error?) -> Void) {
        self.fetchEmployees(matching: query, completionHandler: completionHandler)
    }

    open func fetchAlphabeticalListOfProduct(matching query: DataQuery) throws -> AlphabeticalListOfProduct {
        return try CastRequired<AlphabeticalListOfProduct>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.alphabeticalListOfProducts)).requiredEntity())
    }

    open func fetchAlphabeticalListOfProduct(matching query: DataQuery, completionHandler: @escaping (AlphabeticalListOfProduct?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: AlphabeticalListOfProduct = try self.fetchAlphabeticalListOfProduct(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchAlphabeticalListOfProducts(matching query: DataQuery = DataQuery()) throws -> Array<AlphabeticalListOfProduct> {
        return try AlphabeticalListOfProduct.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.alphabeticalListOfProducts)).entityList())
    }

    open func fetchAlphabeticalListOfProducts(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<AlphabeticalListOfProduct>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<AlphabeticalListOfProduct> = try self.fetchAlphabeticalListOfProducts(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCategories(matching query: DataQuery = DataQuery()) throws -> Array<Category> {
        return try Category.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.categories)).entityList())
    }

    open func fetchCategories(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Category>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Category> = try self.fetchCategories(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCategory(matching query: DataQuery) throws -> Category {
        return try CastRequired<Category>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.categories)).requiredEntity())
    }

    open func fetchCategory(matching query: DataQuery, completionHandler: @escaping (Category?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Category = try self.fetchCategory(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCategorySalesFor1997(matching query: DataQuery = DataQuery()) throws -> Array<CategorySalesFor1997> {
        return try CategorySalesFor1997.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.categorySalesFor1997)).entityList())
    }

    open func fetchCategorySalesFor1997(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<CategorySalesFor1997>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<CategorySalesFor1997> = try self.fetchCategorySalesFor1997(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCategorySalesFor1997_1(matching query: DataQuery) throws -> CategorySalesFor1997 {
        return try CastRequired<CategorySalesFor1997>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.categorySalesFor1997)).requiredEntity())
    }

    open func fetchCategorySalesFor1997_1(matching query: DataQuery, completionHandler: @escaping (CategorySalesFor1997?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: CategorySalesFor1997 = try self.fetchCategorySalesFor1997_1(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCurrentProductList(matching query: DataQuery) throws -> CurrentProductList {
        return try CastRequired<CurrentProductList>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.currentProductLists)).requiredEntity())
    }

    open func fetchCurrentProductList(matching query: DataQuery, completionHandler: @escaping (CurrentProductList?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: CurrentProductList = try self.fetchCurrentProductList(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCurrentProductLists(matching query: DataQuery = DataQuery()) throws -> Array<CurrentProductList> {
        return try CurrentProductList.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.currentProductLists)).entityList())
    }

    open func fetchCurrentProductLists(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<CurrentProductList>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<CurrentProductList> = try self.fetchCurrentProductLists(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCustomer(matching query: DataQuery) throws -> Customer {
        return try CastRequired<Customer>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.customers)).requiredEntity())
    }

    open func fetchCustomer(matching query: DataQuery, completionHandler: @escaping (Customer?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Customer = try self.fetchCustomer(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCustomerAndSuppliersByCities(matching query: DataQuery = DataQuery()) throws -> Array<CustomerAndSuppliersByCity> {
        return try CustomerAndSuppliersByCity.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.customerAndSuppliersByCities)).entityList())
    }

    open func fetchCustomerAndSuppliersByCities(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<CustomerAndSuppliersByCity>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<CustomerAndSuppliersByCity> = try self.fetchCustomerAndSuppliersByCities(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCustomerAndSuppliersByCity(matching query: DataQuery) throws -> CustomerAndSuppliersByCity {
        return try CastRequired<CustomerAndSuppliersByCity>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.customerAndSuppliersByCities)).requiredEntity())
    }

    open func fetchCustomerAndSuppliersByCity(matching query: DataQuery, completionHandler: @escaping (CustomerAndSuppliersByCity?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: CustomerAndSuppliersByCity = try self.fetchCustomerAndSuppliersByCity(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCustomerDemographic(matching query: DataQuery) throws -> CustomerDemographic {
        return try CastRequired<CustomerDemographic>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.customerDemographics)).requiredEntity())
    }

    open func fetchCustomerDemographic(matching query: DataQuery, completionHandler: @escaping (CustomerDemographic?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: CustomerDemographic = try self.fetchCustomerDemographic(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCustomerDemographics(matching query: DataQuery = DataQuery()) throws -> Array<CustomerDemographic> {
        return try CustomerDemographic.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.customerDemographics)).entityList())
    }

    open func fetchCustomerDemographics(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<CustomerDemographic>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<CustomerDemographic> = try self.fetchCustomerDemographics(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCustomers(matching query: DataQuery = DataQuery()) throws -> Array<Customer> {
        return try Customer.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.customers)).entityList())
    }

    open func fetchCustomers(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Customer>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Customer> = try self.fetchCustomers(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEmployee(matching query: DataQuery) throws -> Employee {
        return try CastRequired<Employee>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.employees)).requiredEntity())
    }

    open func fetchEmployee(matching query: DataQuery, completionHandler: @escaping (Employee?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Employee = try self.fetchEmployee(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEmployees(matching query: DataQuery = DataQuery()) throws -> Array<Employee> {
        return try Employee.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.employees)).entityList())
    }

    open func fetchEmployees(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Employee>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Employee> = try self.fetchEmployees(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchInvoice(matching query: DataQuery) throws -> Invoice {
        return try CastRequired<Invoice>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.invoices)).requiredEntity())
    }

    open func fetchInvoice(matching query: DataQuery, completionHandler: @escaping (Invoice?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Invoice = try self.fetchInvoice(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchInvoices(matching query: DataQuery = DataQuery()) throws -> Array<Invoice> {
        return try Invoice.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.invoices)).entityList())
    }

    open func fetchInvoices(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Invoice>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Invoice> = try self.fetchInvoices(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchOrder(matching query: DataQuery) throws -> Order {
        return try CastRequired<Order>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.orders)).requiredEntity())
    }

    open func fetchOrder(matching query: DataQuery, completionHandler: @escaping (Order?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Order = try self.fetchOrder(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchOrderDetail(matching query: DataQuery) throws -> OrderDetail {
        return try CastRequired<OrderDetail>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.orderDetails)).requiredEntity())
    }

    open func fetchOrderDetail(matching query: DataQuery, completionHandler: @escaping (OrderDetail?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: OrderDetail = try self.fetchOrderDetail(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchOrderDetails(matching query: DataQuery = DataQuery()) throws -> Array<OrderDetail> {
        return try OrderDetail.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.orderDetails)).entityList())
    }

    open func fetchOrderDetails(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<OrderDetail>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<OrderDetail> = try self.fetchOrderDetails(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchOrderDetailsExtended(matching query: DataQuery) throws -> OrderDetailsExtended {
        return try CastRequired<OrderDetailsExtended>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.orderDetailsExtendeds)).requiredEntity())
    }

    open func fetchOrderDetailsExtended(matching query: DataQuery, completionHandler: @escaping (OrderDetailsExtended?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: OrderDetailsExtended = try self.fetchOrderDetailsExtended(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchOrderDetailsExtendeds(matching query: DataQuery = DataQuery()) throws -> Array<OrderDetailsExtended> {
        return try OrderDetailsExtended.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.orderDetailsExtendeds)).entityList())
    }

    open func fetchOrderDetailsExtendeds(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<OrderDetailsExtended>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<OrderDetailsExtended> = try self.fetchOrderDetailsExtendeds(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchOrderSubtotal(matching query: DataQuery) throws -> OrderSubtotal {
        return try CastRequired<OrderSubtotal>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.orderSubtotals)).requiredEntity())
    }

    open func fetchOrderSubtotal(matching query: DataQuery, completionHandler: @escaping (OrderSubtotal?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: OrderSubtotal = try self.fetchOrderSubtotal(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchOrderSubtotals(matching query: DataQuery = DataQuery()) throws -> Array<OrderSubtotal> {
        return try OrderSubtotal.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.orderSubtotals)).entityList())
    }

    open func fetchOrderSubtotals(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<OrderSubtotal>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<OrderSubtotal> = try self.fetchOrderSubtotals(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchOrders(matching query: DataQuery = DataQuery()) throws -> Array<Order> {
        return try Order.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.orders)).entityList())
    }

    open func fetchOrders(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Order>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Order> = try self.fetchOrders(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchOrdersQries(matching query: DataQuery = DataQuery()) throws -> Array<OrdersQry> {
        return try OrdersQry.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.ordersQries)).entityList())
    }

    open func fetchOrdersQries(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<OrdersQry>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<OrdersQry> = try self.fetchOrdersQries(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchOrdersQry(matching query: DataQuery) throws -> OrdersQry {
        return try CastRequired<OrdersQry>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.ordersQries)).requiredEntity())
    }

    open func fetchOrdersQry(matching query: DataQuery, completionHandler: @escaping (OrdersQry?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: OrdersQry = try self.fetchOrdersQry(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProduct(matching query: DataQuery) throws -> Product {
        return try CastRequired<Product>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.products)).requiredEntity())
    }

    open func fetchProduct(matching query: DataQuery, completionHandler: @escaping (Product?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Product = try self.fetchProduct(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductSalesFor1997(matching query: DataQuery = DataQuery()) throws -> Array<ProductSalesFor1997> {
        return try ProductSalesFor1997.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.productSalesFor1997)).entityList())
    }

    open func fetchProductSalesFor1997(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ProductSalesFor1997>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<ProductSalesFor1997> = try self.fetchProductSalesFor1997(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductSalesFor1997_1(matching query: DataQuery) throws -> ProductSalesFor1997 {
        return try CastRequired<ProductSalesFor1997>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.productSalesFor1997)).requiredEntity())
    }

    open func fetchProductSalesFor1997_1(matching query: DataQuery, completionHandler: @escaping (ProductSalesFor1997?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: ProductSalesFor1997 = try self.fetchProductSalesFor1997_1(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProducts(matching query: DataQuery = DataQuery()) throws -> Array<Product> {
        return try Product.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.products)).entityList())
    }

    open func fetchProducts(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Product>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Product> = try self.fetchProducts(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductsAboveAveragePrice(matching query: DataQuery) throws -> ProductsAboveAveragePrice {
        return try CastRequired<ProductsAboveAveragePrice>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.productsAboveAveragePrices)).requiredEntity())
    }

    open func fetchProductsAboveAveragePrice(matching query: DataQuery, completionHandler: @escaping (ProductsAboveAveragePrice?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: ProductsAboveAveragePrice = try self.fetchProductsAboveAveragePrice(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductsAboveAveragePrices(matching query: DataQuery = DataQuery()) throws -> Array<ProductsAboveAveragePrice> {
        return try ProductsAboveAveragePrice.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.productsAboveAveragePrices)).entityList())
    }

    open func fetchProductsAboveAveragePrices(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ProductsAboveAveragePrice>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<ProductsAboveAveragePrice> = try self.fetchProductsAboveAveragePrices(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductsByCategories(matching query: DataQuery = DataQuery()) throws -> Array<ProductsByCategory> {
        return try ProductsByCategory.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.productsByCategories)).entityList())
    }

    open func fetchProductsByCategories(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ProductsByCategory>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<ProductsByCategory> = try self.fetchProductsByCategories(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductsByCategory(matching query: DataQuery) throws -> ProductsByCategory {
        return try CastRequired<ProductsByCategory>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.productsByCategories)).requiredEntity())
    }

    open func fetchProductsByCategory(matching query: DataQuery, completionHandler: @escaping (ProductsByCategory?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: ProductsByCategory = try self.fetchProductsByCategory(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchRegion(matching query: DataQuery) throws -> Region {
        return try CastRequired<Region>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.regions)).requiredEntity())
    }

    open func fetchRegion(matching query: DataQuery, completionHandler: @escaping (Region?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Region = try self.fetchRegion(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchRegions(matching query: DataQuery = DataQuery()) throws -> Array<Region> {
        return try Region.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.regions)).entityList())
    }

    open func fetchRegions(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Region>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Region> = try self.fetchRegions(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesByCategories(matching query: DataQuery = DataQuery()) throws -> Array<SalesByCategory> {
        return try SalesByCategory.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.salesByCategories)).entityList())
    }

    open func fetchSalesByCategories(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SalesByCategory>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<SalesByCategory> = try self.fetchSalesByCategories(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesByCategory(matching query: DataQuery) throws -> SalesByCategory {
        return try CastRequired<SalesByCategory>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.salesByCategories)).requiredEntity())
    }

    open func fetchSalesByCategory(matching query: DataQuery, completionHandler: @escaping (SalesByCategory?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: SalesByCategory = try self.fetchSalesByCategory(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesTotalsByAmount(matching query: DataQuery) throws -> SalesTotalsByAmount {
        return try CastRequired<SalesTotalsByAmount>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.salesTotalsByAmounts)).requiredEntity())
    }

    open func fetchSalesTotalsByAmount(matching query: DataQuery, completionHandler: @escaping (SalesTotalsByAmount?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: SalesTotalsByAmount = try self.fetchSalesTotalsByAmount(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesTotalsByAmounts(matching query: DataQuery = DataQuery()) throws -> Array<SalesTotalsByAmount> {
        return try SalesTotalsByAmount.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.salesTotalsByAmounts)).entityList())
    }

    open func fetchSalesTotalsByAmounts(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SalesTotalsByAmount>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<SalesTotalsByAmount> = try self.fetchSalesTotalsByAmounts(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchShipper(matching query: DataQuery) throws -> Shipper {
        return try CastRequired<Shipper>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.shippers)).requiredEntity())
    }

    open func fetchShipper(matching query: DataQuery, completionHandler: @escaping (Shipper?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Shipper = try self.fetchShipper(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchShippers(matching query: DataQuery = DataQuery()) throws -> Array<Shipper> {
        return try Shipper.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.shippers)).entityList())
    }

    open func fetchShippers(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Shipper>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Shipper> = try self.fetchShippers(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSummaryOfSalesByQuarter(matching query: DataQuery) throws -> SummaryOfSalesByQuarter {
        return try CastRequired<SummaryOfSalesByQuarter>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.summaryOfSalesByQuarters)).requiredEntity())
    }

    open func fetchSummaryOfSalesByQuarter(matching query: DataQuery, completionHandler: @escaping (SummaryOfSalesByQuarter?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: SummaryOfSalesByQuarter = try self.fetchSummaryOfSalesByQuarter(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSummaryOfSalesByQuarters(matching query: DataQuery = DataQuery()) throws -> Array<SummaryOfSalesByQuarter> {
        return try SummaryOfSalesByQuarter.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.summaryOfSalesByQuarters)).entityList())
    }

    open func fetchSummaryOfSalesByQuarters(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SummaryOfSalesByQuarter>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<SummaryOfSalesByQuarter> = try self.fetchSummaryOfSalesByQuarters(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSummaryOfSalesByYear(matching query: DataQuery) throws -> SummaryOfSalesByYear {
        return try CastRequired<SummaryOfSalesByYear>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.summaryOfSalesByYears)).requiredEntity())
    }

    open func fetchSummaryOfSalesByYear(matching query: DataQuery, completionHandler: @escaping (SummaryOfSalesByYear?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: SummaryOfSalesByYear = try self.fetchSummaryOfSalesByYear(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSummaryOfSalesByYears(matching query: DataQuery = DataQuery()) throws -> Array<SummaryOfSalesByYear> {
        return try SummaryOfSalesByYear.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.summaryOfSalesByYears)).entityList())
    }

    open func fetchSummaryOfSalesByYears(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SummaryOfSalesByYear>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<SummaryOfSalesByYear> = try self.fetchSummaryOfSalesByYears(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSupplier(matching query: DataQuery) throws -> Supplier {
        return try CastRequired<Supplier>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.suppliers)).requiredEntity())
    }

    open func fetchSupplier(matching query: DataQuery, completionHandler: @escaping (Supplier?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Supplier = try self.fetchSupplier(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSuppliers(matching query: DataQuery = DataQuery()) throws -> Array<Supplier> {
        return try Supplier.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.suppliers)).entityList())
    }

    open func fetchSuppliers(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Supplier>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Supplier> = try self.fetchSuppliers(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchTerritories(matching query: DataQuery = DataQuery()) throws -> Array<Territory> {
        return try Territory.array(from: self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.territories)).entityList())
    }

    open func fetchTerritories(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Territory>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Territory> = try self.fetchTerritories(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchTerritory(matching query: DataQuery) throws -> Territory {
        return try CastRequired<Territory>.from(self.executeQuery(query.fromDefault(NorthwindEntitiesMetadata.EntitySets.territories)).requiredEntity())
    }

    open func fetchTerritory(matching query: DataQuery, completionHandler: @escaping (Territory?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Territory = try self.fetchTerritory(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchInvoices")
    open func invoices(query: DataQuery = DataQuery()) throws -> Array<Invoice> {
        return try self.fetchInvoices(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchInvoices")
    open func invoices(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Invoice>?, Error?) -> Void) {
        self.fetchInvoices(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchOrderDetails")
    open func orderDetails(query: DataQuery = DataQuery()) throws -> Array<OrderDetail> {
        return try self.fetchOrderDetails(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchOrderDetails")
    open func orderDetails(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<OrderDetail>?, Error?) -> Void) {
        self.fetchOrderDetails(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchOrderDetailsExtendeds")
    open func orderDetailsExtendeds(query: DataQuery = DataQuery()) throws -> Array<OrderDetailsExtended> {
        return try self.fetchOrderDetailsExtendeds(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchOrderDetailsExtendeds")
    open func orderDetailsExtendeds(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<OrderDetailsExtended>?, Error?) -> Void) {
        self.fetchOrderDetailsExtendeds(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchOrderSubtotals")
    open func orderSubtotals(query: DataQuery = DataQuery()) throws -> Array<OrderSubtotal> {
        return try self.fetchOrderSubtotals(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchOrderSubtotals")
    open func orderSubtotals(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<OrderSubtotal>?, Error?) -> Void) {
        self.fetchOrderSubtotals(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchOrders")
    open func orders(query: DataQuery = DataQuery()) throws -> Array<Order> {
        return try self.fetchOrders(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchOrders")
    open func orders(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Order>?, Error?) -> Void) {
        self.fetchOrders(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchOrdersQries")
    open func ordersQries(query: DataQuery = DataQuery()) throws -> Array<OrdersQry> {
        return try self.fetchOrdersQries(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchOrdersQries")
    open func ordersQries(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<OrdersQry>?, Error?) -> Void) {
        self.fetchOrdersQries(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductSalesFor1997")
    open func productSalesFor1997(query: DataQuery = DataQuery()) throws -> Array<ProductSalesFor1997> {
        return try self.fetchProductSalesFor1997(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductSalesFor1997")
    open func productSalesFor1997(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ProductSalesFor1997>?, Error?) -> Void) {
        self.fetchProductSalesFor1997(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProducts")
    open func products(query: DataQuery = DataQuery()) throws -> Array<Product> {
        return try self.fetchProducts(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProducts")
    open func products(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Product>?, Error?) -> Void) {
        self.fetchProducts(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductsAboveAveragePrices")
    open func productsAboveAveragePrices(query: DataQuery = DataQuery()) throws -> Array<ProductsAboveAveragePrice> {
        return try self.fetchProductsAboveAveragePrices(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductsAboveAveragePrices")
    open func productsAboveAveragePrices(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ProductsAboveAveragePrice>?, Error?) -> Void) {
        self.fetchProductsAboveAveragePrices(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductsByCategories")
    open func productsByCategories(query: DataQuery = DataQuery()) throws -> Array<ProductsByCategory> {
        return try self.fetchProductsByCategories(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductsByCategories")
    open func productsByCategories(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ProductsByCategory>?, Error?) -> Void) {
        self.fetchProductsByCategories(matching: query, completionHandler: completionHandler)
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: NorthwindEntitiesMetadataParser.options)
            NorthwindEntitiesMetadataChanges.merge(metadata: self.metadata)
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchRegions")
    open func regions(query: DataQuery = DataQuery()) throws -> Array<Region> {
        return try self.fetchRegions(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchRegions")
    open func regions(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Region>?, Error?) -> Void) {
        self.fetchRegions(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesByCategories")
    open func salesByCategories(query: DataQuery = DataQuery()) throws -> Array<SalesByCategory> {
        return try self.fetchSalesByCategories(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesByCategories")
    open func salesByCategories(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SalesByCategory>?, Error?) -> Void) {
        self.fetchSalesByCategories(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesTotalsByAmounts")
    open func salesTotalsByAmounts(query: DataQuery = DataQuery()) throws -> Array<SalesTotalsByAmount> {
        return try self.fetchSalesTotalsByAmounts(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesTotalsByAmounts")
    open func salesTotalsByAmounts(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SalesTotalsByAmount>?, Error?) -> Void) {
        self.fetchSalesTotalsByAmounts(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchShippers")
    open func shippers(query: DataQuery = DataQuery()) throws -> Array<Shipper> {
        return try self.fetchShippers(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchShippers")
    open func shippers(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Shipper>?, Error?) -> Void) {
        self.fetchShippers(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSummaryOfSalesByQuarters")
    open func summaryOfSalesByQuarters(query: DataQuery = DataQuery()) throws -> Array<SummaryOfSalesByQuarter> {
        return try self.fetchSummaryOfSalesByQuarters(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSummaryOfSalesByQuarters")
    open func summaryOfSalesByQuarters(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SummaryOfSalesByQuarter>?, Error?) -> Void) {
        self.fetchSummaryOfSalesByQuarters(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSummaryOfSalesByYears")
    open func summaryOfSalesByYears(query: DataQuery = DataQuery()) throws -> Array<SummaryOfSalesByYear> {
        return try self.fetchSummaryOfSalesByYears(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSummaryOfSalesByYears")
    open func summaryOfSalesByYears(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SummaryOfSalesByYear>?, Error?) -> Void) {
        self.fetchSummaryOfSalesByYears(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSuppliers")
    open func suppliers(query: DataQuery = DataQuery()) throws -> Array<Supplier> {
        return try self.fetchSuppliers(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSuppliers")
    open func suppliers(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Supplier>?, Error?) -> Void) {
        self.fetchSuppliers(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchTerritories")
    open func territories(query: DataQuery = DataQuery()) throws -> Array<Territory> {
        return try self.fetchTerritories(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchTerritories")
    open func territories(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Territory>?, Error?) -> Void) {
        self.fetchTerritories(matching: query, completionHandler: completionHandler)
    }
}
