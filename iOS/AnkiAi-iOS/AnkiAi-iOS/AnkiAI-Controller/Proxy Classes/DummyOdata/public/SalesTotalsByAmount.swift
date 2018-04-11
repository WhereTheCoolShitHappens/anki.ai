// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class SalesTotalsByAmount: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var saleAmount: Property = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "SaleAmount")

    public static var orderID: Property = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "OrderID")

    public static var companyName: Property = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "CompanyName")

    public static var shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "ShippedDate")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount)
    }

    open class func array(from: EntityValueList) -> Array<SalesTotalsByAmount> {
        return ArrayConverter.convert(from.toArray(), Array<SalesTotalsByAmount>())
    }

    open var companyName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesTotalsByAmount.companyName))
        }
        set(value) {
            self.setOptionalValue(for: SalesTotalsByAmount.companyName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> SalesTotalsByAmount {
        return CastRequired<SalesTotalsByAmount>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(companyName: String?, orderID: Int?) -> EntityKey {
        return EntityKey().with(name: "CompanyName", value: StringValue.of(optional: companyName)).with(name: "OrderID", value: IntValue.of(optional: orderID))
    }

    open var old: SalesTotalsByAmount {
        return CastRequired<SalesTotalsByAmount>.from(self.oldEntity)
    }

    open var orderID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: SalesTotalsByAmount.orderID))
        }
        set(value) {
            self.setOptionalValue(for: SalesTotalsByAmount.orderID, to: IntValue.of(optional: value))
        }
    }

    open var saleAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesTotalsByAmount.saleAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesTotalsByAmount.saleAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var shippedDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: SalesTotalsByAmount.shippedDate))
        }
        set(value) {
            self.setOptionalValue(for: SalesTotalsByAmount.shippedDate, to: value)
        }
    }
}
