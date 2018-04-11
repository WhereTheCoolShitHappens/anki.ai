//
// AlphabeticalListOfProductsDetailViewController.swift
// AnkiAi-iOS
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/04/18
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData

class AlphabeticalListOfProductsDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var northwindEntities: NorthwindEntities<OnlineODataProvider> {
        return self.appDelegate.northwindEntities
    }

    private var validity = [String: Bool]()
    private var _entity: AlphabeticalListOfProduct?
    var allowsEditableCells = false
    var entity: AlphabeticalListOfProduct {
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

    private let logger = Logger.shared(named: "AlphabeticalListOfProductsMasterViewControllerLogger")
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
            let detailViewController = dest.viewControllers[0] as! AlphabeticalListOfProductsDetailViewController
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
            return self.cellForProductID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.productID)
        case 1:
            return self.cellForProductName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.productName)
        case 2:
            return self.cellForSupplierID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.supplierID)
        case 3:
            return self.cellForCategoryID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.categoryID)
        case 4:
            return self.cellForQuantityPerUnit(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.quantityPerUnit)
        case 5:
            return self.cellForUnitPrice(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.unitPrice)
        case 6:
            return self.cellForUnitsInStock(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.unitsInStock)
        case 7:
            return self.cellForUnitsOnOrder(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.unitsOnOrder)
        case 8:
            return self.cellForReorderLevel(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.reorderLevel)
        case 9:
            return self.cellForDiscontinued(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.discontinued)
        case 10:
            return self.cellForCategoryName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: AlphabeticalListOfProduct.categoryName)
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: self.allowsEditableCells)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 11
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    // MARK: - OData property specific cell creators

    private func cellForProductID(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
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

    private func cellForProductName(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.productName ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if AlphabeticalListOfProduct.productName.isOptional || newValue != "" {
                currentEntity.productName = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForSupplierID(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.supplierID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.supplierID = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.supplierID = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCategoryID(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.categoryID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.categoryID = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.categoryID = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForQuantityPerUnit(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.quantityPerUnit {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.quantityPerUnit = nil
                isNewValueValid = true
            } else {
                if AlphabeticalListOfProduct.quantityPerUnit.isOptional || newValue != "" {
                    currentEntity.quantityPerUnit = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForUnitPrice(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.unitPrice {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.unitPrice = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.unitPrice = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForUnitsInStock(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.unitsInStock {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.unitsInStock = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.unitsInStock = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForUnitsOnOrder(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.unitsOnOrder {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.unitsOnOrder = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.unitsOnOrder = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForReorderLevel(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.reorderLevel {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.reorderLevel = nil
                isNewValueValid = true
            } else {
                if let validValue = Int(newValue) {
                    currentEntity.reorderLevel = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDiscontinued(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
        var value = ""
        value = currentEntity.discontinued != nil ? "\(currentEntity.discontinued!)" : ""
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if let validValue = Bool(newValue) {
                currentEntity.discontinued = validValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCategoryName(tableView: UITableView, indexPath: IndexPath, currentEntity: AlphabeticalListOfProduct, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.categoryName ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if AlphabeticalListOfProduct.categoryName.isOptional || newValue != "" {
                currentEntity.categoryName = newValue
                isNewValueValid = true
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

    func createEntityWithDefaultValues() -> AlphabeticalListOfProduct {
        let newEntity = AlphabeticalListOfProduct()
        // Fill the mandatory properties with default values
        newEntity.productID = CellCreationHelper.defaultValueFor(AlphabeticalListOfProduct.productID)
        newEntity.productName = CellCreationHelper.defaultValueFor(AlphabeticalListOfProduct.productName)
        newEntity.discontinued = CellCreationHelper.defaultValueFor(AlphabeticalListOfProduct.discontinued)
        newEntity.categoryName = CellCreationHelper.defaultValueFor(AlphabeticalListOfProduct.categoryName)

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.categoryName == nil || newEntity.categoryName!.isEmpty {
            self.validity["CategoryName"] = false
        }
        if newEntity.discontinued == nil {
            self.validity["Discontinued"] = false
        }
        if newEntity.productID == nil {
            self.validity["ProductID"] = false
        }
        if newEntity.productName == nil || newEntity.productName!.isEmpty {
            self.validity["ProductName"] = false
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

extension AlphabeticalListOfProductsDetailViewController: EntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! AlphabeticalListOfProduct
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
