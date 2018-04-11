// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Customer: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var customerID: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "CustomerID")

    public static var companyName: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "CompanyName")

    public static var contactName: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "ContactName")

    public static var contactTitle: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "ContactTitle")

    public static var address: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Address")

    public static var city: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "City")

    public static var region: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Region")

    public static var postalCode: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "PostalCode")

    public static var country: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Country")

    public static var phone: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Phone")

    public static var fax: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Fax")

    public static var orders: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Orders")

    public static var customerDemographics: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "CustomerDemographics")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.customer)
    }

    open var address: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.address))
        }
        set(value) {
            self.setOptionalValue(for: Customer.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<Customer> {
        return ArrayConverter.convert(from.toArray(), Array<Customer>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.city))
        }
        set(value) {
            self.setOptionalValue(for: Customer.city, to: StringValue.of(optional: value))
        }
    }

    open var companyName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.companyName))
        }
        set(value) {
            self.setOptionalValue(for: Customer.companyName, to: StringValue.of(optional: value))
        }
    }

    open var contactName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.contactName))
        }
        set(value) {
            self.setOptionalValue(for: Customer.contactName, to: StringValue.of(optional: value))
        }
    }

    open var contactTitle: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.contactTitle))
        }
        set(value) {
            self.setOptionalValue(for: Customer.contactTitle, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Customer {
        return CastRequired<Customer>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.country))
        }
        set(value) {
            self.setOptionalValue(for: Customer.country, to: StringValue.of(optional: value))
        }
    }

    open var customerDemographics: Array<CustomerDemographic> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Customer.customerDemographics)).toArray(), Array<CustomerDemographic>())
        }
        set(value) {
            Customer.customerDemographics.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var customerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.customerID))
        }
        set(value) {
            self.setOptionalValue(for: Customer.customerID, to: StringValue.of(optional: value))
        }
    }

    open var fax: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.fax))
        }
        set(value) {
            self.setOptionalValue(for: Customer.fax, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(customerID: String?) -> EntityKey {
        return EntityKey().with(name: "CustomerID", value: StringValue.of(optional: customerID))
    }

    open var old: Customer {
        return CastRequired<Customer>.from(self.oldEntity)
    }

    open var orders: Array<Order> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Customer.orders)).toArray(), Array<Order>())
        }
        set(value) {
            Customer.orders.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var phone: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.phone))
        }
        set(value) {
            self.setOptionalValue(for: Customer.phone, to: StringValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.postalCode))
        }
        set(value) {
            self.setOptionalValue(for: Customer.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var region: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.region))
        }
        set(value) {
            self.setOptionalValue(for: Customer.region, to: StringValue.of(optional: value))
        }
    }
}
