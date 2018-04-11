// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Order: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var orderID: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "OrderID")

    public static var customerID: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "CustomerID")

    public static var employeeID: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "EmployeeID")

    public static var orderDate: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "OrderDate")

    public static var requiredDate: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "RequiredDate")

    public static var shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShippedDate")

    public static var shipVia: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipVia")

    public static var freight: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Freight")

    public static var shipName: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipName")

    public static var shipAddress: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipAddress")

    public static var shipCity: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipCity")

    public static var shipRegion: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipRegion")

    public static var shipPostalCode: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipPostalCode")

    public static var shipCountry: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipCountry")

    public static var customer: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Customer")

    public static var employee: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Employee")

    public static var orderDetails: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Order_Details")

    public static var shipper: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Shipper")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.order)
    }

    open class func array(from: EntityValueList) -> Array<Order> {
        return ArrayConverter.convert(from.toArray(), Array<Order>())
    }

    open func copy() -> Order {
        return CastRequired<Order>.from(self.copyEntity())
    }

    open var customer: Customer? {
        get {
            return CastOptional<Customer>.from(self.optionalValue(for: Order.customer))
        }
        set(value) {
            self.setOptionalValue(for: Order.customer, to: value)
        }
    }

    open var customerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Order.customerID))
        }
        set(value) {
            self.setOptionalValue(for: Order.customerID, to: StringValue.of(optional: value))
        }
    }

    open var employee: Employee? {
        get {
            return CastOptional<Employee>.from(self.optionalValue(for: Order.employee))
        }
        set(value) {
            self.setOptionalValue(for: Order.employee, to: value)
        }
    }

    open var employeeID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Order.employeeID))
        }
        set(value) {
            self.setOptionalValue(for: Order.employeeID, to: IntValue.of(optional: value))
        }
    }

    open var freight: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Order.freight))
        }
        set(value) {
            self.setOptionalValue(for: Order.freight, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(orderID: Int?) -> EntityKey {
        return EntityKey().with(name: "OrderID", value: IntValue.of(optional: orderID))
    }

    open var old: Order {
        return CastRequired<Order>.from(self.oldEntity)
    }

    open var orderDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Order.orderDate))
        }
        set(value) {
            self.setOptionalValue(for: Order.orderDate, to: value)
        }
    }

    open var orderDetails: Array<OrderDetail> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Order.orderDetails)).toArray(), Array<OrderDetail>())
        }
        set(value) {
            Order.orderDetails.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var orderID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Order.orderID))
        }
        set(value) {
            self.setOptionalValue(for: Order.orderID, to: IntValue.of(optional: value))
        }
    }

    open var requiredDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Order.requiredDate))
        }
        set(value) {
            self.setOptionalValue(for: Order.requiredDate, to: value)
        }
    }

    open var shipAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Order.shipAddress))
        }
        set(value) {
            self.setOptionalValue(for: Order.shipAddress, to: StringValue.of(optional: value))
        }
    }

    open var shipCity: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Order.shipCity))
        }
        set(value) {
            self.setOptionalValue(for: Order.shipCity, to: StringValue.of(optional: value))
        }
    }

    open var shipCountry: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Order.shipCountry))
        }
        set(value) {
            self.setOptionalValue(for: Order.shipCountry, to: StringValue.of(optional: value))
        }
    }

    open var shipName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Order.shipName))
        }
        set(value) {
            self.setOptionalValue(for: Order.shipName, to: StringValue.of(optional: value))
        }
    }

    open var shipPostalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Order.shipPostalCode))
        }
        set(value) {
            self.setOptionalValue(for: Order.shipPostalCode, to: StringValue.of(optional: value))
        }
    }

    open var shipRegion: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Order.shipRegion))
        }
        set(value) {
            self.setOptionalValue(for: Order.shipRegion, to: StringValue.of(optional: value))
        }
    }

    open var shipVia: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Order.shipVia))
        }
        set(value) {
            self.setOptionalValue(for: Order.shipVia, to: IntValue.of(optional: value))
        }
    }

    open var shippedDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Order.shippedDate))
        }
        set(value) {
            self.setOptionalValue(for: Order.shippedDate, to: value)
        }
    }

    open var shipper: Shipper? {
        get {
            return CastOptional<Shipper>.from(self.optionalValue(for: Order.shipper))
        }
        set(value) {
            self.setOptionalValue(for: Order.shipper, to: value)
        }
    }
}
