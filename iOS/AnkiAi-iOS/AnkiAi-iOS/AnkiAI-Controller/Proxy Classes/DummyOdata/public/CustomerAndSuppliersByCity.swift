// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class CustomerAndSuppliersByCity: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var city: Property = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "City")

    public static var companyName: Property = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "CompanyName")

    public static var contactName: Property = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "ContactName")

    public static var relationship: Property = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "Relationship")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity)
    }

    open class func array(from: EntityValueList) -> Array<CustomerAndSuppliersByCity> {
        return ArrayConverter.convert(from.toArray(), Array<CustomerAndSuppliersByCity>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CustomerAndSuppliersByCity.city))
        }
        set(value) {
            self.setOptionalValue(for: CustomerAndSuppliersByCity.city, to: StringValue.of(optional: value))
        }
    }

    open var companyName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CustomerAndSuppliersByCity.companyName))
        }
        set(value) {
            self.setOptionalValue(for: CustomerAndSuppliersByCity.companyName, to: StringValue.of(optional: value))
        }
    }

    open var contactName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CustomerAndSuppliersByCity.contactName))
        }
        set(value) {
            self.setOptionalValue(for: CustomerAndSuppliersByCity.contactName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> CustomerAndSuppliersByCity {
        return CastRequired<CustomerAndSuppliersByCity>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(companyName: String?, relationship: String?) -> EntityKey {
        return EntityKey().with(name: "CompanyName", value: StringValue.of(optional: companyName)).with(name: "Relationship", value: StringValue.of(optional: relationship))
    }

    open var old: CustomerAndSuppliersByCity {
        return CastRequired<CustomerAndSuppliersByCity>.from(self.oldEntity)
    }

    open var relationship: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CustomerAndSuppliersByCity.relationship))
        }
        set(value) {
            self.setOptionalValue(for: CustomerAndSuppliersByCity.relationship, to: StringValue.of(optional: value))
        }
    }
}
