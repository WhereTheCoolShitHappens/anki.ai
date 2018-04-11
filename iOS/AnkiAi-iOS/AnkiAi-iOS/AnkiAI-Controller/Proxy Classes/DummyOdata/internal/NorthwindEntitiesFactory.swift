// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

internal class NorthwindEntitiesFactory {
    static func registerAll() throws {
        NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.registerFactory(ObjectFactory.with(create: { AlphabeticalListOfProduct(withDefaults: false) }, createWithDecoder: { d in try AlphabeticalListOfProduct(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.category.registerFactory(ObjectFactory.with(create: { Category(withDefaults: false) }, createWithDecoder: { d in try Category(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997.registerFactory(ObjectFactory.with(create: { CategorySalesFor1997(withDefaults: false) }, createWithDecoder: { d in try CategorySalesFor1997(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.currentProductList.registerFactory(ObjectFactory.with(create: { CurrentProductList(withDefaults: false) }, createWithDecoder: { d in try CurrentProductList(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.customer.registerFactory(ObjectFactory.with(create: { Customer(withDefaults: false) }, createWithDecoder: { d in try Customer(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.customerDemographic.registerFactory(ObjectFactory.with(create: { CustomerDemographic(withDefaults: false) }, createWithDecoder: { d in try CustomerDemographic(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.registerFactory(ObjectFactory.with(create: { CustomerAndSuppliersByCity(withDefaults: false) }, createWithDecoder: { d in try CustomerAndSuppliersByCity(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.employee.registerFactory(ObjectFactory.with(create: { Employee(withDefaults: false) }, createWithDecoder: { d in try Employee(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.invoice.registerFactory(ObjectFactory.with(create: { Invoice(withDefaults: false) }, createWithDecoder: { d in try Invoice(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.order.registerFactory(ObjectFactory.with(create: { Order(withDefaults: false) }, createWithDecoder: { d in try Order(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.orderDetail.registerFactory(ObjectFactory.with(create: { OrderDetail(withDefaults: false) }, createWithDecoder: { d in try OrderDetail(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.registerFactory(ObjectFactory.with(create: { OrderDetailsExtended(withDefaults: false) }, createWithDecoder: { d in try OrderDetailsExtended(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.orderSubtotal.registerFactory(ObjectFactory.with(create: { OrderSubtotal(withDefaults: false) }, createWithDecoder: { d in try OrderSubtotal(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.ordersQry.registerFactory(ObjectFactory.with(create: { OrdersQry(withDefaults: false) }, createWithDecoder: { d in try OrdersQry(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.product.registerFactory(ObjectFactory.with(create: { Product(withDefaults: false) }, createWithDecoder: { d in try Product(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.registerFactory(ObjectFactory.with(create: { ProductSalesFor1997(withDefaults: false) }, createWithDecoder: { d in try ProductSalesFor1997(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice.registerFactory(ObjectFactory.with(create: { ProductsAboveAveragePrice(withDefaults: false) }, createWithDecoder: { d in try ProductsAboveAveragePrice(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.productsByCategory.registerFactory(ObjectFactory.with(create: { ProductsByCategory(withDefaults: false) }, createWithDecoder: { d in try ProductsByCategory(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.region.registerFactory(ObjectFactory.with(create: { Region(withDefaults: false) }, createWithDecoder: { d in try Region(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.registerFactory(ObjectFactory.with(create: { SalesTotalsByAmount(withDefaults: false) }, createWithDecoder: { d in try SalesTotalsByAmount(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.salesByCategory.registerFactory(ObjectFactory.with(create: { SalesByCategory(withDefaults: false) }, createWithDecoder: { d in try SalesByCategory(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.shipper.registerFactory(ObjectFactory.with(create: { Shipper(withDefaults: false) }, createWithDecoder: { d in try Shipper(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.registerFactory(ObjectFactory.with(create: { SummaryOfSalesByQuarter(withDefaults: false) }, createWithDecoder: { d in try SummaryOfSalesByQuarter(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.registerFactory(ObjectFactory.with(create: { SummaryOfSalesByYear(withDefaults: false) }, createWithDecoder: { d in try SummaryOfSalesByYear(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.supplier.registerFactory(ObjectFactory.with(create: { Supplier(withDefaults: false) }, createWithDecoder: { d in try Supplier(from: d) }))
        NorthwindEntitiesMetadata.EntityTypes.territory.registerFactory(ObjectFactory.with(create: { Territory(withDefaults: false) }, createWithDecoder: { d in try Territory(from: d) }))
        NorthwindEntitiesStaticResolver.resolve()
    }
}
