// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class OrderSubtotal: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var orderID: Property = NorthwindEntitiesMetadata.EntityTypes.orderSubtotal.property(withName: "OrderID")

    public static var subtotal: Property = NorthwindEntitiesMetadata.EntityTypes.orderSubtotal.property(withName: "Subtotal")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.orderSubtotal)
    }

    open class func array(from: EntityValueList) -> Array<OrderSubtotal> {
        return ArrayConverter.convert(from.toArray(), Array<OrderSubtotal>())
    }

    open func copy() -> OrderSubtotal {
        return CastRequired<OrderSubtotal>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(orderID: Int?) -> EntityKey {
        return EntityKey().with(name: "OrderID", value: IntValue.of(optional: orderID))
    }

    open var old: OrderSubtotal {
        return CastRequired<OrderSubtotal>.from(self.oldEntity)
    }

    open var orderID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: OrderSubtotal.orderID))
        }
        set(value) {
            self.setOptionalValue(for: OrderSubtotal.orderID, to: IntValue.of(optional: value))
        }
    }

    open var subtotal: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: OrderSubtotal.subtotal))
        }
        set(value) {
            self.setOptionalValue(for: OrderSubtotal.subtotal, to: DecimalValue.of(optional: value))
        }
    }
}
