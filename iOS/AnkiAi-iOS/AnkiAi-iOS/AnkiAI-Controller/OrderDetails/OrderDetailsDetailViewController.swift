//
// OrderDetailsDetailViewController.swift
// AnkiAi-iOS
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/04/18
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData

class OrderDetailsDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var northwindEntities: NorthwindEntities<OnlineODataProvider> {
        return self.appDelegate.northwindEntities
    }

    private var validity = [String: Bool]()
    private var _entity: OrderDetail?
    var allowsEditableCells = false
    var entity: OrderDetail {
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

    private let logger = Logger.shared(named: "OrderDetailsMasterViewControllerLogger")
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
            let detailViewController = dest.viewControllers[0] as! OrderDetailsDetailViewController
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
            return self.cellForOrderID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrderDetail.orderID)
        case 1:
            return self.cellForProductID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrderDetail.productID)
        case 2:
            return self.cellForUnitPrice(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrderDetail.unitPrice)
        case 3:
            return self.cellForQuantity(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrderDetail.quantity)
        case 4:
            return self.cellForDiscount(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: OrderDetail.discount)
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: self.allowsEditableCells)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 5
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    // MARK: - OData property specific cell creators

    private func cellForOrderID(tableView: UITableView, indexPath: IndexPath, currentEntity: OrderDetail, property: Property) -> UITableViewCell {
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

    private func cellForProductID(tableView: UITableView, indexPath: IndexPath, currentEntity: OrderDetail, property: Property) -> UITableViewCell {
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

    private func cellForUnitPrice(tableView: UITableView, indexPath: IndexPath, currentEntity: OrderDetail, property: Property) -> UITableViewCell {
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

    private func cellForQuantity(tableView: UITableView, indexPath: IndexPath, currentEntity: OrderDetail, property: Property) -> UITableViewCell {
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

    private func cellForDiscount(tableView: UITableView, indexPath: IndexPath, currentEntity: OrderDetail, property: Property) -> UITableViewCell {
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

    func createEntityWithDefaultValues() -> OrderDetail {
        let newEntity = OrderDetail()
        // Fill the mandatory properties with default values
        newEntity.orderID = CellCreationHelper.defaultValueFor(OrderDetail.orderID)
        newEntity.productID = CellCreationHelper.defaultValueFor(OrderDetail.productID)
        newEntity.unitPrice = CellCreationHelper.defaultValueFor(OrderDetail.unitPrice)
        newEntity.quantity = CellCreationHelper.defaultValueFor(OrderDetail.quantity)
        newEntity.discount = CellCreationHelper.defaultValueFor(OrderDetail.discount)

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.orderID == nil {
            self.validity["OrderID"] = false
        }
        if newEntity.productID == nil {
            self.validity["ProductID"] = false
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

extension OrderDetailsDetailViewController: EntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! OrderDetail
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
