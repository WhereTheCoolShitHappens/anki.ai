// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class CustomerDemographic: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var customerTypeID: Property = NorthwindEntitiesMetadata.EntityTypes.customerDemographic.property(withName: "CustomerTypeID")

    public static var customerDesc: Property = NorthwindEntitiesMetadata.EntityTypes.customerDemographic.property(withName: "CustomerDesc")

    public static var customers: Property = NorthwindEntitiesMetadata.EntityTypes.customerDemographic.property(withName: "Customers")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.customerDemographic)
    }

    open class func array(from: EntityValueList) -> Array<CustomerDemographic> {
        return ArrayConverter.convert(from.toArray(), Array<CustomerDemographic>())
    }

    open func copy() -> CustomerDemographic {
        return CastRequired<CustomerDemographic>.from(self.copyEntity())
    }

    open var customerDesc: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CustomerDemographic.customerDesc))
        }
        set(value) {
            self.setOptionalValue(for: CustomerDemographic.customerDesc, to: StringValue.of(optional: value))
        }
    }

    open var customerTypeID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CustomerDemographic.customerTypeID))
        }
        set(value) {
            self.setOptionalValue(for: CustomerDemographic.customerTypeID, to: StringValue.of(optional: value))
        }
    }

    open var customers: Array<Customer> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: CustomerDemographic.customers)).toArray(), Array<Customer>())
        }
        set(value) {
            CustomerDemographic.customers.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(customerTypeID: String?) -> EntityKey {
        return EntityKey().with(name: "CustomerTypeID", value: StringValue.of(optional: customerTypeID))
    }

    open var old: CustomerDemographic {
        return CastRequired<CustomerDemographic>.from(self.oldEntity)
    }
}
