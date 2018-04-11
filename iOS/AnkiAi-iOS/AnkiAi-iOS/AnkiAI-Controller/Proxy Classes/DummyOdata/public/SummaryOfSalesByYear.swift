// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class SummaryOfSalesByYear: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.property(withName: "ShippedDate")

    public static var orderID: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.property(withName: "OrderID")

    public static var subtotal: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.property(withName: "Subtotal")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear)
    }

    open class func array(from: EntityValueList) -> Array<SummaryOfSalesByYear> {
        return ArrayConverter.convert(from.toArray(), Array<SummaryOfSalesByYear>())
    }

    open func copy() -> SummaryOfSalesByYear {
        return CastRequired<SummaryOfSalesByYear>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(orderID: Int?) -> EntityKey {
        return EntityKey().with(name: "OrderID", value: IntValue.of(optional: orderID))
    }

    open var old: SummaryOfSalesByYear {
        return CastRequired<SummaryOfSalesByYear>.from(self.oldEntity)
    }

    open var orderID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: SummaryOfSalesByYear.orderID))
        }
        set(value) {
            self.setOptionalValue(for: SummaryOfSalesByYear.orderID, to: IntValue.of(optional: value))
        }
    }

    open var shippedDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: SummaryOfSalesByYear.shippedDate))
        }
        set(value) {
            self.setOptionalValue(for: SummaryOfSalesByYear.shippedDate, to: value)
        }
    }

    open var subtotal: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SummaryOfSalesByYear.subtotal))
        }
        set(value) {
            self.setOptionalValue(for: SummaryOfSalesByYear.subtotal, to: DecimalValue.of(optional: value))
        }
    }
}
