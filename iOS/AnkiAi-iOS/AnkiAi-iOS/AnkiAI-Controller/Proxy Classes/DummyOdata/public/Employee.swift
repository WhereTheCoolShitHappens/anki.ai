// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Employee: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var employeeID: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "EmployeeID")

    public static var lastName: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "LastName")

    public static var firstName: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "FirstName")

    public static var title: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Title")

    public static var titleOfCourtesy: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "TitleOfCourtesy")

    public static var birthDate: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "BirthDate")

    public static var hireDate: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "HireDate")

    public static var address: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Address")

    public static var city: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "City")

    public static var region: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Region")

    public static var postalCode: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "PostalCode")

    public static var country: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Country")

    public static var homePhone: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "HomePhone")

    public static var `extension`: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Extension")

    public static var photo: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Photo")

    public static var notes: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Notes")

    public static var reportsTo: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "ReportsTo")

    public static var photoPath: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "PhotoPath")

    public static var employees1: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Employees1")

    public static var employee1: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Employee1")

    public static var orders: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Orders")

    public static var territories: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Territories")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.employee)
    }

    open var `extension`: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.extension))
        }
        set(value) {
            self.setOptionalValue(for: Employee.extension, to: StringValue.of(optional: value))
        }
    }

    open var address: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.address))
        }
        set(value) {
            self.setOptionalValue(for: Employee.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<Employee> {
        return ArrayConverter.convert(from.toArray(), Array<Employee>())
    }

    open var birthDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Employee.birthDate))
        }
        set(value) {
            self.setOptionalValue(for: Employee.birthDate, to: value)
        }
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.city))
        }
        set(value) {
            self.setOptionalValue(for: Employee.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Employee {
        return CastRequired<Employee>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.country))
        }
        set(value) {
            self.setOptionalValue(for: Employee.country, to: StringValue.of(optional: value))
        }
    }

    open var employee1: Employee? {
        get {
            return CastOptional<Employee>.from(self.optionalValue(for: Employee.employee1))
        }
        set(value) {
            self.setOptionalValue(for: Employee.employee1, to: value)
        }
    }

    open var employeeID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Employee.employeeID))
        }
        set(value) {
            self.setOptionalValue(for: Employee.employeeID, to: IntValue.of(optional: value))
        }
    }

    open var employees1: Array<Employee> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Employee.employees1)).toArray(), Array<Employee>())
        }
        set(value) {
            Employee.employees1.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var firstName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.firstName))
        }
        set(value) {
            self.setOptionalValue(for: Employee.firstName, to: StringValue.of(optional: value))
        }
    }

    open var hireDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Employee.hireDate))
        }
        set(value) {
            self.setOptionalValue(for: Employee.hireDate, to: value)
        }
    }

    open var homePhone: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.homePhone))
        }
        set(value) {
            self.setOptionalValue(for: Employee.homePhone, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(employeeID: Int?) -> EntityKey {
        return EntityKey().with(name: "EmployeeID", value: IntValue.of(optional: employeeID))
    }

    open var lastName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.lastName))
        }
        set(value) {
            self.setOptionalValue(for: Employee.lastName, to: StringValue.of(optional: value))
        }
    }

    open var notes: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.notes))
        }
        set(value) {
            self.setOptionalValue(for: Employee.notes, to: StringValue.of(optional: value))
        }
    }

    open var old: Employee {
        return CastRequired<Employee>.from(self.oldEntity)
    }

    open var orders: Array<Order> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Employee.orders)).toArray(), Array<Order>())
        }
        set(value) {
            Employee.orders.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var photo: Data? {
        get {
            return BinaryValue.optional(self.optionalValue(for: Employee.photo))
        }
        set(value) {
            self.setOptionalValue(for: Employee.photo, to: BinaryValue.of(optional: value))
        }
    }

    open var photoPath: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.photoPath))
        }
        set(value) {
            self.setOptionalValue(for: Employee.photoPath, to: StringValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.postalCode))
        }
        set(value) {
            self.setOptionalValue(for: Employee.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var region: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.region))
        }
        set(value) {
            self.setOptionalValue(for: Employee.region, to: StringValue.of(optional: value))
        }
    }

    open var reportsTo: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Employee.reportsTo))
        }
        set(value) {
            self.setOptionalValue(for: Employee.reportsTo, to: IntValue.of(optional: value))
        }
    }

    open var territories: Array<Territory> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Employee.territories)).toArray(), Array<Territory>())
        }
        set(value) {
            Employee.territories.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var title: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.title))
        }
        set(value) {
            self.setOptionalValue(for: Employee.title, to: StringValue.of(optional: value))
        }
    }

    open var titleOfCourtesy: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Employee.titleOfCourtesy))
        }
        set(value) {
            self.setOptionalValue(for: Employee.titleOfCourtesy, to: StringValue.of(optional: value))
        }
    }
}
