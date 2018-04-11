//
// CollectionsViewController.swift
// AnkiAi-iOS
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/04/18
//

import Foundation
import SAPFiori
import SAPOData

protocol EntityUpdaterDelegate {
    func entityHasChanged(_ entity: EntityValue?)
}

protocol EntitySetUpdaterDelegate {
    func entitySetHasChanged()
}

class CollectionsViewController: FUIFormTableViewController {
    private var collections = CollectionType.all

    // Variable to store the selected index path
    private var selectedIndex: IndexPath?

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var isPresentedInSplitView: Bool {
        return !(self.splitViewController?.isCollapsed ?? true)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeSelection()
    }

    override func viewWillTransition(to _: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            let isNotInSplitView = !self.isPresentedInSplitView
            self.tableView.visibleCells.forEach { cell in
                // To refresh the disclosure indicator of each cell
                cell.accessoryType = isNotInSplitView ? .disclosureIndicator : .none
            }
            self.makeSelection()
        })
    }

    // MARK: - UITableViewDelegate

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.collections.count
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = self.collections[indexPath.row].rawValue
        cell.accessoryType = !self.isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        self.collectionSelected(at: indexPath)
    }

    // CollectionType selection helper

    private func collectionSelected(at: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard
        var masterViewController: UIViewController!
        switch self.collections[at.row] {
        case .currentProductLists:
            let currentProductListsStoryBoard = UIStoryboard(name: "CurrentProductLists", bundle: nil)
            masterViewController = currentProductListsStoryBoard.instantiateViewController(withIdentifier: "CurrentProductListsMaster")
            masterViewController.navigationItem.title = "CurrentProductLists"
        case .productsByCategories:
            let productsByCategoriesStoryBoard = UIStoryboard(name: "ProductsByCategories", bundle: nil)
            masterViewController = productsByCategoriesStoryBoard.instantiateViewController(withIdentifier: "ProductsByCategoriesMaster")
            masterViewController.navigationItem.title = "ProductsByCategories"
        case .productsAboveAveragePrices:
            let productsAboveAveragePricesStoryBoard = UIStoryboard(name: "ProductsAboveAveragePrices", bundle: nil)
            masterViewController = productsAboveAveragePricesStoryBoard.instantiateViewController(withIdentifier: "ProductsAboveAveragePricesMaster")
            masterViewController.navigationItem.title = "ProductsAboveAveragePrices"
        case .regions:
            let regionsStoryBoard = UIStoryboard(name: "Regions", bundle: nil)
            masterViewController = regionsStoryBoard.instantiateViewController(withIdentifier: "RegionsMaster")
            masterViewController.navigationItem.title = "Regions"
        case .invoices:
            let invoicesStoryBoard = UIStoryboard(name: "Invoices", bundle: nil)
            masterViewController = invoicesStoryBoard.instantiateViewController(withIdentifier: "InvoicesMaster")
            masterViewController.navigationItem.title = "Invoices"
        case .productSalesFor1997:
            let productSalesFor1997StoryBoard = UIStoryboard(name: "ProductSalesFor1997", bundle: nil)
            masterViewController = productSalesFor1997StoryBoard.instantiateViewController(withIdentifier: "ProductSalesFor1997Master")
            masterViewController.navigationItem.title = "ProductSalesFor1997"
        case .customerDemographics:
            let customerDemographicsStoryBoard = UIStoryboard(name: "CustomerDemographics", bundle: nil)
            masterViewController = customerDemographicsStoryBoard.instantiateViewController(withIdentifier: "CustomerDemographicsMaster")
            masterViewController.navigationItem.title = "CustomerDemographics"
        case .salesByCategories:
            let salesByCategoriesStoryBoard = UIStoryboard(name: "SalesByCategories", bundle: nil)
            masterViewController = salesByCategoriesStoryBoard.instantiateViewController(withIdentifier: "SalesByCategoriesMaster")
            masterViewController.navigationItem.title = "SalesByCategories"
        case .suppliers:
            let suppliersStoryBoard = UIStoryboard(name: "Suppliers", bundle: nil)
            masterViewController = suppliersStoryBoard.instantiateViewController(withIdentifier: "SuppliersMaster")
            masterViewController.navigationItem.title = "Suppliers"
        case .employees:
            let employeesStoryBoard = UIStoryboard(name: "Employees", bundle: nil)
            masterViewController = employeesStoryBoard.instantiateViewController(withIdentifier: "EmployeesMaster")
            masterViewController.navigationItem.title = "Employees"
        case .orderDetailsExtendeds:
            let orderDetailsExtendedsStoryBoard = UIStoryboard(name: "OrderDetailsExtendeds", bundle: nil)
            masterViewController = orderDetailsExtendedsStoryBoard.instantiateViewController(withIdentifier: "OrderDetailsExtendedsMaster")
            masterViewController.navigationItem.title = "OrderDetailsExtendeds"
        case .customerAndSuppliersByCities:
            let customerAndSuppliersByCitiesStoryBoard = UIStoryboard(name: "CustomerAndSuppliersByCities", bundle: nil)
            masterViewController = customerAndSuppliersByCitiesStoryBoard.instantiateViewController(withIdentifier: "CustomerAndSuppliersByCitiesMaster")
            masterViewController.navigationItem.title = "CustomerAndSuppliersByCities"
        case .shippers:
            let shippersStoryBoard = UIStoryboard(name: "Shippers", bundle: nil)
            masterViewController = shippersStoryBoard.instantiateViewController(withIdentifier: "ShippersMaster")
            masterViewController.navigationItem.title = "Shippers"
        case .orderSubtotals:
            let orderSubtotalsStoryBoard = UIStoryboard(name: "OrderSubtotals", bundle: nil)
            masterViewController = orderSubtotalsStoryBoard.instantiateViewController(withIdentifier: "OrderSubtotalsMaster")
            masterViewController.navigationItem.title = "OrderSubtotals"
        case .alphabeticalListOfProducts:
            let alphabeticalListOfProductsStoryBoard = UIStoryboard(name: "AlphabeticalListOfProducts", bundle: nil)
            masterViewController = alphabeticalListOfProductsStoryBoard.instantiateViewController(withIdentifier: "AlphabeticalListOfProductsMaster")
            masterViewController.navigationItem.title = "AlphabeticalListOfProducts"
        case .categories:
            let categoriesStoryBoard = UIStoryboard(name: "Categories", bundle: nil)
            masterViewController = categoriesStoryBoard.instantiateViewController(withIdentifier: "CategoriesMaster")
            masterViewController.navigationItem.title = "Categories"
        case .territories:
            let territoriesStoryBoard = UIStoryboard(name: "Territories", bundle: nil)
            masterViewController = territoriesStoryBoard.instantiateViewController(withIdentifier: "TerritoriesMaster")
            masterViewController.navigationItem.title = "Territories"
        case .categorySalesFor1997:
            let categorySalesFor1997StoryBoard = UIStoryboard(name: "CategorySalesFor1997", bundle: nil)
            masterViewController = categorySalesFor1997StoryBoard.instantiateViewController(withIdentifier: "CategorySalesFor1997Master")
            masterViewController.navigationItem.title = "CategorySalesFor1997"
        case .products:
            let productsStoryBoard = UIStoryboard(name: "Products", bundle: nil)
            masterViewController = productsStoryBoard.instantiateViewController(withIdentifier: "ProductsMaster")
            masterViewController.navigationItem.title = "Products"
        case .customers:
            let customersStoryBoard = UIStoryboard(name: "Customers", bundle: nil)
            masterViewController = customersStoryBoard.instantiateViewController(withIdentifier: "CustomersMaster")
            masterViewController.navigationItem.title = "Customers"
        case .orders:
            let ordersStoryBoard = UIStoryboard(name: "Orders", bundle: nil)
            masterViewController = ordersStoryBoard.instantiateViewController(withIdentifier: "OrdersMaster")
            masterViewController.navigationItem.title = "Orders"
        case .summaryOfSalesByYears:
            let summaryOfSalesByYearsStoryBoard = UIStoryboard(name: "SummaryOfSalesByYears", bundle: nil)
            masterViewController = summaryOfSalesByYearsStoryBoard.instantiateViewController(withIdentifier: "SummaryOfSalesByYearsMaster")
            masterViewController.navigationItem.title = "SummaryOfSalesByYears"
        case .orderDetails:
            let orderDetailsStoryBoard = UIStoryboard(name: "OrderDetails", bundle: nil)
            masterViewController = orderDetailsStoryBoard.instantiateViewController(withIdentifier: "OrderDetailsMaster")
            masterViewController.navigationItem.title = "OrderDetails"
        case .salesTotalsByAmounts:
            let salesTotalsByAmountsStoryBoard = UIStoryboard(name: "SalesTotalsByAmounts", bundle: nil)
            masterViewController = salesTotalsByAmountsStoryBoard.instantiateViewController(withIdentifier: "SalesTotalsByAmountsMaster")
            masterViewController.navigationItem.title = "SalesTotalsByAmounts"
        case .summaryOfSalesByQuarters:
            let summaryOfSalesByQuartersStoryBoard = UIStoryboard(name: "SummaryOfSalesByQuarters", bundle: nil)
            masterViewController = summaryOfSalesByQuartersStoryBoard.instantiateViewController(withIdentifier: "SummaryOfSalesByQuartersMaster")
            masterViewController.navigationItem.title = "SummaryOfSalesByQuarters"
        case .ordersQries:
            let ordersQriesStoryBoard = UIStoryboard(name: "OrdersQries", bundle: nil)
            masterViewController = ordersQriesStoryBoard.instantiateViewController(withIdentifier: "OrdersQriesMaster")
            masterViewController.navigationItem.title = "OrdersQries"
        case .none:
            masterViewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }

    // MARK: - Handle highlighting of selected cell

    private func makeSelection() {
        if let selectedIndex = selectedIndex {
            self.tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            self.tableView.scrollToRow(at: selectedIndex, at: .none, animated: true)
        } else {
            self.selectDefault()
        }
    }

    private func selectDefault() {
        // Automatically select first element if we have two panels (iPhone plus and iPad only)
        if self.splitViewController!.isCollapsed || self.appDelegate.northwindEntities == nil {
            return
        }
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        self.collectionSelected(at: indexPath)
    }
}
