// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class OrdersQry: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var orderID: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "OrderID")

    public static var customerID: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "CustomerID")

    public static var employeeID: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "EmployeeID")

    public static var orderDate: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "OrderDate")

    public static var requiredDate: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "RequiredDate")

    public static var shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShippedDate")

    public static var shipVia: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipVia")

    public static var freight: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Freight")

    public static var shipName: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipName")

    public static var shipAddress: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipAddress")

    public static var shipCity: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipCity")

    public static var shipRegion: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipRegion")

    public static var shipPostalCode: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipPostalCode")

    public static var shipCountry: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipCountry")

    public static var companyName: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "CompanyName")

    public static var address: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Address")

    public static var city: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "City")

    public static var region: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Region")

    public static var postalCode: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "PostalCode")

    public static var country: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Country")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.ordersQry)
    }

    open var address: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.address))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<OrdersQry> {
        return ArrayConverter.convert(from.toArray(), Array<OrdersQry>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.city))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.city, to: StringValue.of(optional: value))
        }
    }

    open var companyName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.companyName))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.companyName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> OrdersQry {
        return CastRequired<OrdersQry>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.country))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.country, to: StringValue.of(optional: value))
        }
    }

    open var customerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.customerID))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.customerID, to: StringValue.of(optional: value))
        }
    }

    open var employeeID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: OrdersQry.employeeID))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.employeeID, to: IntValue.of(optional: value))
        }
    }

    open var freight: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: OrdersQry.freight))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.freight, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(companyName: String?, orderID: Int?) -> EntityKey {
        return EntityKey().with(name: "CompanyName", value: StringValue.of(optional: companyName)).with(name: "OrderID", value: IntValue.of(optional: orderID))
    }

    open var old: OrdersQry {
        return CastRequired<OrdersQry>.from(self.oldEntity)
    }

    open var orderDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: OrdersQry.orderDate))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.orderDate, to: value)
        }
    }

    open var orderID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: OrdersQry.orderID))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.orderID, to: IntValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.postalCode))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var region: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.region))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.region, to: StringValue.of(optional: value))
        }
    }

    open var requiredDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: OrdersQry.requiredDate))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.requiredDate, to: value)
        }
    }

    open var shipAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.shipAddress))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.shipAddress, to: StringValue.of(optional: value))
        }
    }

    open var shipCity: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.shipCity))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.shipCity, to: StringValue.of(optional: value))
        }
    }

    open var shipCountry: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.shipCountry))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.shipCountry, to: StringValue.of(optional: value))
        }
    }

    open var shipName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.shipName))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.shipName, to: StringValue.of(optional: value))
        }
    }

    open var shipPostalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.shipPostalCode))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.shipPostalCode, to: StringValue.of(optional: value))
        }
    }

    open var shipRegion: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrdersQry.shipRegion))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.shipRegion, to: StringValue.of(optional: value))
        }
    }

    open var shipVia: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: OrdersQry.shipVia))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.shipVia, to: IntValue.of(optional: value))
        }
    }

    open var shippedDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: OrdersQry.shippedDate))
        }
        set(value) {
            self.setOptionalValue(for: OrdersQry.shippedDate, to: value)
        }
    }
}
