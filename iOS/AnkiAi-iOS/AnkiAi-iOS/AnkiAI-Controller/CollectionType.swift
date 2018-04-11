//
// CollectionType.swift
// AnkiAi-iOS
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/04/18
//

import Foundation

enum CollectionType: String {
    case currentProductLists = "CurrentProductLists"
    case productsByCategories = "ProductsByCategories"
    case productsAboveAveragePrices = "ProductsAboveAveragePrices"
    case regions = "Regions"
    case invoices = "Invoices"
    case productSalesFor1997 = "ProductSalesFor1997"
    case customerDemographics = "CustomerDemographics"
    case salesByCategories = "SalesByCategories"
    case suppliers = "Suppliers"
    case employees = "Employees"
    case orderDetailsExtendeds = "OrderDetailsExtendeds"
    case customerAndSuppliersByCities = "CustomerAndSuppliersByCities"
    case shippers = "Shippers"
    case orderSubtotals = "OrderSubtotals"
    case alphabeticalListOfProducts = "AlphabeticalListOfProducts"
    case categories = "Categories"
    case territories = "Territories"
    case categorySalesFor1997 = "CategorySalesFor1997"
    case products = "Products"
    case customers = "Customers"
    case orders = "Orders"
    case summaryOfSalesByYears = "SummaryOfSalesByYears"
    case orderDetails = "OrderDetails"
    case salesTotalsByAmounts = "SalesTotalsByAmounts"
    case summaryOfSalesByQuarters = "SummaryOfSalesByQuarters"
    case ordersQries = "OrdersQries"
    case none = ""

    static let all = [
        currentProductLists, productsByCategories, productsAboveAveragePrices, regions, invoices, productSalesFor1997, customerDemographics, salesByCategories, suppliers, employees, orderDetailsExtendeds, customerAndSuppliersByCities, shippers, orderSubtotals, alphabeticalListOfProducts, categories, territories, categorySalesFor1997, products, customers, orders, summaryOfSalesByYears, orderDetails, salesTotalsByAmounts, summaryOfSalesByQuarters, ordersQries,
    ]
}
