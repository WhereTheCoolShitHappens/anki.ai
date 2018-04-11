// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class SummaryOfSalesByQuarter: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.property(withName: "ShippedDate")

    public static var orderID: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.property(withName: "OrderID")

    public static var subtotal: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.property(withName: "Subtotal")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter)
    }

    open class func array(from: EntityValueList) -> Array<SummaryOfSalesByQuarter> {
        return ArrayConverter.convert(from.toArray(), Array<SummaryOfSalesByQuarter>())
    }

    open func copy() -> SummaryOfSalesByQuarter {
        return CastRequired<SummaryOfSalesByQuarter>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(orderID: Int?) -> EntityKey {
        return EntityKey().with(name: "OrderID", value: IntValue.of(optional: orderID))
    }

    open var old: SummaryOfSalesByQuarter {
        return CastRequired<SummaryOfSalesByQuarter>.from(self.oldEntity)
    }

    open var orderID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: SummaryOfSalesByQuarter.orderID))
        }
        set(value) {
            self.setOptionalValue(for: SummaryOfSalesByQuarter.orderID, to: IntValue.of(optional: value))
        }
    }

    open var shippedDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: SummaryOfSalesByQuarter.shippedDate))
        }
        set(value) {
            self.setOptionalValue(for: SummaryOfSalesByQuarter.shippedDate, to: value)
        }
    }

    open var subtotal: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SummaryOfSalesByQuarter.subtotal))
        }
        set(value) {
            self.setOptionalValue(for: SummaryOfSalesByQuarter.subtotal, to: DecimalValue.of(optional: value))
        }
    }
}
