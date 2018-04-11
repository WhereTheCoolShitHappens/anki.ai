//
// InvoicesDetailViewController.swift
// AnkiAi-iOS
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/04/18
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData

class InvoicesDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var northwindEntities: NorthwindEntities<OnlineODataProvider> {
        return self.appDelegate.northwindEntities
    }

    private var validity = [String: Bool]()
    private var _entity: Invoice?
    var allowsEditableCells = false
    var entity: Invoice {
        get {
            if self._entity == nil {
                self._entity = self.createEntityWithDefaultValues()
            }
            return self._entity!
        }
        set {
            self._entity = newValue
        }
    }

    private let logger = Logger.shared(named: "InvoicesMasterViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var entityUpdater: EntityUpdaterDelegate?
    var tableUpdater: EntitySetUpdaterDelegate?
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "updateEntity" {
            // Show the Detail view with the current entity, where the properties scan be edited and updated
            self.logger.info("Showing a view to update the selected entity.")
            let dest = segue.destination as! UINavigationController
            let detailViewController = dest.viewControllers[0] as! InvoicesDetailViewController
            detailViewController.title = NSLocalizedString("keyUpdateEntityTitle", value: "Update Entity", comment: "XTIT: Title of update selected entity screen.")
            detailViewController.entity = self.entity
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: detailViewController, action: #selector(detailViewController.updateEntity))
            detailViewController.navigationItem.rightBarButtonItem = doneButton
            let cancelButton = UIBarButtonItem(title: NSLocalizedString("keyCancelButtonToGoPreviousScreen", value: "Cancel", comment: "XBUT: Title of Cancel button."), style: .plain, target: detailViewController, action: #selector(detailViewController.cancel))
            detailViewController.navigationItem.leftBarButtonItem = cancelButton
            detailViewController.allowsEditableCells = true
            detailViewController.entityUpdater = self
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.cellForShipName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.shipName)
        case 1:
            return self.cellForShipAddress(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.shipAddress)
        case 2:
            return self.cellForShipCity(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.shipCity)
        case 3:
            return self.cellForShipRegion(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.shipRegion)
        case 4:
            return self.cellForShipPostalCode(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.shipPostalCode)
        case 5:
            return self.cellForShipCountry(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.shipCountry)
        case 6:
            return self.cellForCustomerID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.customerID)
        case 7:
            return self.cellForCustomerName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.customerName)
        case 8:
            return self.cellForAddress(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.address)
        case 9:
            return self.cellForCity(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.city)
        case 10:
            return self.cellForRegion(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.region)
        case 11:
            return self.cellForPostalCode(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.postalCode)
        case 12:
            return self.cellForCountry(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.country)
        case 13:
            return self.cellForSalesperson(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.salesperson)
        case 14:
            return self.cellForOrderID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.orderID)
        case 15:
            return self.cellForOrderDate(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.orderDate)
        case 16:
            return self.cellForRequiredDate(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.requiredDate)
        case 17:
            return self.cellForShippedDate(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.shippedDate)
        case 18:
            return self.cellForShipperName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.shipperName)
        case 19:
            return self.cellForProductID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.productID)
        case 20:
            return self.cellForProductName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.productName)
        case 21:
            return self.cellForUnitPrice(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.unitPrice)
        case 22:
            return self.cellForQuantity(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.quantity)
        case 23:
            return self.cellForDiscount(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.discount)
        case 24:
            return self.cellForExtendedPrice(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.extendedPrice)
        case 25:
            return self.cellForFreight(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Invoice.freight)
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: self.allowsEditableCells)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 26
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    // MARK: - OData property specific cell creators

    private func cellForShipName(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.shipName {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.shipName = nil
                isNewValueValid = true
            } else {
                if Invoice.shipName.isOptional || newValue != "" {
                    currentEntity.shipName = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipAddress(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.shipAddress {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.shipAddress = nil
                isNewValueValid = true
            } else {
                if Invoice.shipAddress.isOptional || newValue != "" {
                    currentEntity.shipAddress = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipCity(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.shipCity {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.shipCity = nil
                isNewValueValid = true
            } else {
                if Invoice.shipCity.isOptional || newValue != "" {
                    currentEntity.shipCity = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipRegion(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.shipRegion {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.shipRegion = nil
                isNewValueValid = true
            } else {
                if Invoice.shipRegion.isOptional || newValue != "" {
                    currentEntity.shipRegion = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipPostalCode(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.shipPostalCode {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.shipPostalCode = nil
                isNewValueValid = true
            } else {
                if Invoice.shipPostalCode.isOptional || newValue != "" {
                    currentEntity.shipPostalCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipCountry(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.shipCountry {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.shipCountry = nil
                isNewValueValid = true
            } else {
                if Invoice.shipCountry.isOptional || newValue != "" {
                    currentEntity.shipCountry = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCustomerID(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.customerID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.customerID = nil
                isNewValueValid = true
            } else {
                if Invoice.customerID.isOptional || newValue != "" {
                    currentEntity.customerID = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCustomerName(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.customerName ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if Invoice.customerName.isOptional || newValue != "" {
                currentEntity.customerName = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForAddress(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.address {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.address = nil
                isNewValueValid = true
            } else {
                if Invoice.address.isOptional || newValue != "" {
                    currentEntity.address = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCity(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.city {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.city = nil
                isNewValueValid = true
            } else {
                if Invoice.city.isOptional || newValue != "" {
                    currentEntity.city = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForRegion(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.region {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.region = nil
                isNewValueValid = true
            } else {
                if Invoice.region.isOptional || newValue != "" {
                    currentEntity.region = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPostalCode(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.postalCode {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.postalCode = nil
                isNewValueValid = true
            } else {
                if Invoice.postalCode.isOptional || newValue != "" {
                    currentEntity.postalCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCountry(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.country {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.country = nil
                isNewValueValid = true
            } else {
                if Invoice.country.isOptional || newValue != "" {
                    currentEntity.country = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForSalesperson(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.salesperson ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if Invoice.salesperson.isOptional || newValue != "" {
                currentEntity.salesperson = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForOrderID(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        value = currentEntity.orderID != nil ? "\(currentEntity.orderID!)" : ""
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if let validValue = Int(newValue) {
                currentEntity.orderID = validValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForOrderDate(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.orderDate {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.orderDate = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.orderDate = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForRequiredDate(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.requiredDate {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.requiredDate = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.requiredDate = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShippedDate(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.shippedDate {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.shippedDate = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.shippedDate = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipperName(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.shipperName ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if Invoice.shipperName.isOptional || newValue != "" {
                currentEntity.shipperName = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForProductID(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        value = currentEntity.productID != nil ? "\(currentEntity.productID!)" : ""
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if let validValue = Int(newValue) {
                currentEntity.productID = validValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForProductName(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.productName ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if Invoice.productName.isOptional || newValue != "" {
                currentEntity.productName = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForUnitPrice(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        value = currentEntity.unitPrice != nil ? "\(currentEntity.unitPrice!)" : ""
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if let validValue = BigDecimal.parse(newValue) {
                currentEntity.unitPrice = validValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForQuantity(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        value = currentEntity.quantity != nil ? "\(currentEntity.quantity!)" : ""
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if let validValue = Int(newValue) {
                currentEntity.quantity = validValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDiscount(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        value = currentEntity.discount != nil ? "\(currentEntity.discount!)" : ""
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if let validValue = Float(newValue) {
                currentEntity.discount = validValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForExtendedPrice(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.extendedPrice {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.extendedPrice = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.extendedPrice = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForFreight(tableView: UITableView, indexPath: IndexPath, currentEntity: Invoice, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.freight {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.freight = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.freight = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    // MARK: - OData functionalities

    @objc func createEntity() {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Creating entity in backend.")
        self.northwindEntities.createEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Create entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityCreationTitle", value: "Create entry failed", comment: "XTIT: Title of alert message about entity creation error."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Create entry finished successfully.")
            OperationQueue.main.addOperation({
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyEntityCreationBody", value: "Created", comment: "XMSG: Title of alert message about successful entity creation."))
                    self.tableUpdater?.entitySetHasChanged()
                }
            })
        }
    }

    func createEntityWithDefaultValues() -> Invoice {
        let newEntity = Invoice()
        // Fill the mandatory properties with default values
        newEntity.customerName = CellCreationHelper.defaultValueFor(Invoice.customerName)
        newEntity.salesperson = CellCreationHelper.defaultValueFor(Invoice.salesperson)
        newEntity.orderID = CellCreationHelper.defaultValueFor(Invoice.orderID)
        newEntity.shipperName = CellCreationHelper.defaultValueFor(Invoice.shipperName)
        newEntity.productID = CellCreationHelper.defaultValueFor(Invoice.productID)
        newEntity.productName = CellCreationHelper.defaultValueFor(Invoice.productName)
        newEntity.unitPrice = CellCreationHelper.defaultValueFor(Invoice.unitPrice)
        newEntity.quantity = CellCreationHelper.defaultValueFor(Invoice.quantity)
        newEntity.discount = CellCreationHelper.defaultValueFor(Invoice.discount)

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.customerName == nil || newEntity.customerName!.isEmpty {
            self.validity["CustomerName"] = false
        }
        if newEntity.discount == nil {
            self.validity["Discount"] = false
        }
        if newEntity.orderID == nil {
            self.validity["OrderID"] = false
        }
        if newEntity.productID == nil {
            self.validity["ProductID"] = false
        }
        if newEntity.productName == nil || newEntity.productName!.isEmpty {
            self.validity["ProductName"] = false
        }
        if newEntity.quantity == nil {
            self.validity["Quantity"] = false
        }
        if newEntity.salesperson == nil || newEntity.salesperson!.isEmpty {
            self.validity["Salesperson"] = false
        }
        if newEntity.shipperName == nil || newEntity.shipperName!.isEmpty {
            self.validity["ShipperName"] = false
        }
        if newEntity.unitPrice == nil {
            self.validity["UnitPrice"] = false
        }
        self.barButtonShouldBeEnabled()
        return newEntity
    }

    @objc func updateEntity(_: AnyObject) {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Updating entity in backend.")
        self.northwindEntities.updateEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Update entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Update entry finished successfully.")
            OperationQueue.main.addOperation({
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Updated", comment: "XTIT: Title of alert message about successful entity update."))
                    self.entityUpdater?.entityHasChanged(self.entity)
                }
            })
        }
    }

    // MARK: - other logic, helper

    @objc func cancel() {
        OperationQueue.main.addOperation({
            self.dismiss(animated: true)
        })
    }

    // Check if all text fields are valid
    private func barButtonShouldBeEnabled() {
        let anyFieldInvalid = self.validity.values.first { field in
            return field == false
        }
        self.navigationItem.rightBarButtonItem?.isEnabled = anyFieldInvalid == nil
    }
}

extension InvoicesDetailViewController: EntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! Invoice
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
