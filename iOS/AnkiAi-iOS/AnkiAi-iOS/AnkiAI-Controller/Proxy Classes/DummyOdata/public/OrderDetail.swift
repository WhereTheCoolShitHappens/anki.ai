// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class OrderDetail: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var orderID: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "OrderID")

    public static var productID: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "ProductID")

    public static var unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "UnitPrice")

    public static var quantity: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Quantity")

    public static var discount: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Discount")

    public static var order: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Order")

    public static var product: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Product")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.orderDetail)
    }

    open class func array(from: EntityValueList) -> Array<OrderDetail> {
        return ArrayConverter.convert(from.toArray(), Array<OrderDetail>())
    }

    open func copy() -> OrderDetail {
        return CastRequired<OrderDetail>.from(self.copyEntity())
    }

    open var discount: Float? {
        get {
            return FloatValue.optional(self.optionalValue(for: OrderDetail.discount))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetail.discount, to: FloatValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(orderID: Int?, productID: Int?) -> EntityKey {
        return EntityKey().with(name: "OrderID", value: IntValue.of(optional: orderID)).with(name: "ProductID", value: IntValue.of(optional: productID))
    }

    open var old: OrderDetail {
        return CastRequired<OrderDetail>.from(self.oldEntity)
    }

    open var order: Order? {
        get {
            return CastOptional<Order>.from(self.optionalValue(for: OrderDetail.order))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetail.order, to: value)
        }
    }

    open var orderID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: OrderDetail.orderID))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetail.orderID, to: IntValue.of(optional: value))
        }
    }

    open var product: Product? {
        get {
            return CastOptional<Product>.from(self.optionalValue(for: OrderDetail.product))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetail.product, to: value)
        }
    }

    open var productID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: OrderDetail.productID))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetail.productID, to: IntValue.of(optional: value))
        }
    }

    open var quantity: Int? {
        get {
            return ShortValue.optional(self.optionalValue(for: OrderDetail.quantity))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetail.quantity, to: ShortValue.of(optional: value))
        }
    }

    open var unitPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: OrderDetail.unitPrice))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetail.unitPrice, to: DecimalValue.of(optional: value))
        }
    }
}
