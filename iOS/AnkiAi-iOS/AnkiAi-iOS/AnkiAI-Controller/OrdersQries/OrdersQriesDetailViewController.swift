//
// OrdersQriesDetailViewController.swift
// AnkiAi-iOS
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/04/18
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData

class OrdersQriesDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var northwindEntities: NorthwindEntities<OnlineODataProvider> {
        return self.appDelegate.northwindEntities
    }

    private var validity = [String: Bool]()
    private var _entity: OrdersQry?
    var allowsEditableCells = false
    var entity: OrdersQry {
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

    private let logger = Logger.shared(named: "OrdersQriesMasterViewControllerLogger")
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
            let detailViewController = dest.viewControllers[0] as! OrdersQriesDetailViewController
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
            return self.cellForOrderID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.orderID)
        case 1:
            return self.cellForCustomerID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.customerID)
        case 2:
            return self.cellForEmployeeID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.employeeID)
        case 3:
            return self.cellForOrderDate(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.orderDate)
        case 4:
            return self.cellForRequiredDate(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.requiredDate)
        case 5:
            return self.cellForShippedDate(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.shippedDate)
        case 6:
            return self.cellForShipVia(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.shipVia)
        case 7:
            return self.cellForFreight(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.freight)
        case 8:
            return self.cellForShipName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.shipName)
        case 9:
            return self.cellForShipAddress(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.shipAddress)
        case 10:
            return self.cellForShipCity(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.shipCity)
        case 11:
            return self.cellForShipRegion(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.shipRegion)
        case 12:
            return self.cellForShipPostalCode(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.shipPostalCode)
        case 13:
            return self.cellForShipCountry(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.shipCountry)
        case 14:
            return self.cellForCompanyName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.companyName)
        case 15:
            return self.cellForAddress(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.address)
        case 16:
            return self.cellForCity(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.city)
        case 17:
            return self.cellForRegion(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.region)
        case 18:
            return self.cellForPostalCode(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.postalCode)
        case 19:
            return self.cellForCountry(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrdersQry.country)
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: self.allowsEditableCells)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 20
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    // MARK: - OData property specific cell creators

    private func cellForOrderID(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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

    private func cellForCustomerID(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.customerID.isOptional || newValue != "" {
                    currentEntity.customerID = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForEmployeeID(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.employeeID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.employeeID = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.employeeID = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForOrderDate(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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

    private func cellForRequiredDate(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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

    private func cellForShippedDate(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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

    private func cellForShipVia(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.shipVia {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.shipVia = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.shipVia = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForFreight(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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

    private func cellForShipName(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.shipName.isOptional || newValue != "" {
                    currentEntity.shipName = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipAddress(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.shipAddress.isOptional || newValue != "" {
                    currentEntity.shipAddress = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipCity(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.shipCity.isOptional || newValue != "" {
                    currentEntity.shipCity = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipRegion(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.shipRegion.isOptional || newValue != "" {
                    currentEntity.shipRegion = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipPostalCode(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.shipPostalCode.isOptional || newValue != "" {
                    currentEntity.shipPostalCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShipCountry(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.shipCountry.isOptional || newValue != "" {
                    currentEntity.shipCountry = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCompanyName(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.companyName ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if OrdersQry.companyName.isOptional || newValue != "" {
                currentEntity.companyName = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForAddress(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.address.isOptional || newValue != "" {
                    currentEntity.address = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCity(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.city.isOptional || newValue != "" {
                    currentEntity.city = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForRegion(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.region.isOptional || newValue != "" {
                    currentEntity.region = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPostalCode(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.postalCode.isOptional || newValue != "" {
                    currentEntity.postalCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCountry(tableView: UITableView, indexPath: IndexPath, currentEntity: OrdersQry, property: Property) -> UITableViewCell {
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
                if OrdersQry.country.isOptional || newValue != "" {
                    currentEntity.country = newValue
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

    func createEntityWithDefaultValues() -> OrdersQry {
        let newEntity = OrdersQry()
        // Fill the mandatory properties with default values
        newEntity.orderID = CellCreationHelper.defaultValueFor(OrdersQry.orderID)
        newEntity.companyName = CellCreationHelper.defaultValueFor(OrdersQry.companyName)

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.companyName == nil || newEntity.companyName!.isEmpty {
            self.validity["CompanyName"] = false
        }
        if newEntity.orderID == nil {
            self.validity["OrderID"] = false
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

extension OrdersQriesDetailViewController: EntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! OrdersQry
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
