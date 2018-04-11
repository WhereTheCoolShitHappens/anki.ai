// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Shipper: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var shipperID: Property = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "ShipperID")

    public static var companyName: Property = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "CompanyName")

    public static var phone: Property = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "Phone")

    public static var orders: Property = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "Orders")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.shipper)
    }

    open class func array(from: EntityValueList) -> Array<Shipper> {
        return ArrayConverter.convert(from.toArray(), Array<Shipper>())
    }

    open var companyName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Shipper.companyName))
        }
        set(value) {
            self.setOptionalValue(for: Shipper.companyName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Shipper {
        return CastRequired<Shipper>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(shipperID: Int?) -> EntityKey {
        return EntityKey().with(name: "ShipperID", value: IntValue.of(optional: shipperID))
    }

    open var old: Shipper {
        return CastRequired<Shipper>.from(self.oldEntity)
    }

    open var orders: Array<Order> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Shipper.orders)).toArray(), Array<Order>())
        }
        set(value) {
            Shipper.orders.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var phone: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Shipper.phone))
        }
        set(value) {
            self.setOptionalValue(for: Shipper.phone, to: StringValue.of(optional: value))
        }
    }

    open var shipperID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Shipper.shipperID))
        }
        set(value) {
            self.setOptionalValue(for: Shipper.shipperID, to: IntValue.of(optional: value))
        }
    }
}
