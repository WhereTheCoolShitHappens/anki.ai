// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Invoice: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var shipName: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipName")

    public static var shipAddress: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipAddress")

    public static var shipCity: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipCity")

    public static var shipRegion: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipRegion")

    public static var shipPostalCode: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipPostalCode")

    public static var shipCountry: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipCountry")

    public static var customerID: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "CustomerID")

    public static var customerName: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "CustomerName")

    public static var address: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Address")

    public static var city: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "City")

    public static var region: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Region")

    public static var postalCode: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "PostalCode")

    public static var country: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Country")

    public static var salesperson: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Salesperson")

    public static var orderID: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "OrderID")

    public static var orderDate: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "OrderDate")

    public static var requiredDate: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "RequiredDate")

    public static var shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShippedDate")

    public static var shipperName: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipperName")

    public static var productID: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ProductID")

    public static var productName: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ProductName")

    public static var unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "UnitPrice")

    public static var quantity: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Quantity")

    public static var discount: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Discount")

    public static var extendedPrice: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ExtendedPrice")

    public static var freight: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Freight")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.invoice)
    }

    open var address: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.address))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<Invoice> {
        return ArrayConverter.convert(from.toArray(), Array<Invoice>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.city))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Invoice {
        return CastRequired<Invoice>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.country))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.country, to: StringValue.of(optional: value))
        }
    }

    open var customerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.customerID))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.customerID, to: StringValue.of(optional: value))
        }
    }

    open var customerName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.customerName))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.customerName, to: StringValue.of(optional: value))
        }
    }

    open var discount: Float? {
        get {
            return FloatValue.optional(self.optionalValue(for: Invoice.discount))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.discount, to: FloatValue.of(optional: value))
        }
    }

    open var extendedPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Invoice.extendedPrice))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.extendedPrice, to: DecimalValue.of(optional: value))
        }
    }

    open var freight: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Invoice.freight))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.freight, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(customerName: String?, discount: Float?, orderID: Int?, productID: Int?, productName: String?, quantity: Int?, salesperson: String?, shipperName: String?, unitPrice: BigDecimal?) -> EntityKey {
        return EntityKey().with(name: "CustomerName", value: StringValue.of(optional: customerName)).with(name: "Discount", value: FloatValue.of(optional: discount)).with(name: "OrderID", value: IntValue.of(optional: orderID)).with(name: "ProductID", value: IntValue.of(optional: productID)).with(name: "ProductName", value: StringValue.of(optional: productName)).with(name: "Quantity", value: ShortValue.of(optional: quantity)).with(name: "Salesperson", value: StringValue.of(optional: salesperson)).with(name: "ShipperName", value: StringValue.of(optional: shipperName)).with(name: "UnitPrice", value: DecimalValue.of(optional: unitPrice))
    }

    open var old: Invoice {
        return CastRequired<Invoice>.from(self.oldEntity)
    }

    open var orderDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Invoice.orderDate))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.orderDate, to: value)
        }
    }

    open var orderID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Invoice.orderID))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.orderID, to: IntValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.postalCode))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var productID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Invoice.productID))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.productID, to: IntValue.of(optional: value))
        }
    }

    open var productName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.productName))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.productName, to: StringValue.of(optional: value))
        }
    }

    open var quantity: Int? {
        get {
            return ShortValue.optional(self.optionalValue(for: Invoice.quantity))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.quantity, to: ShortValue.of(optional: value))
        }
    }

    open var region: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.region))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.region, to: StringValue.of(optional: value))
        }
    }

    open var requiredDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Invoice.requiredDate))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.requiredDate, to: value)
        }
    }

    open var salesperson: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.salesperson))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.salesperson, to: StringValue.of(optional: value))
        }
    }

    open var shipAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.shipAddress))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.shipAddress, to: StringValue.of(optional: value))
        }
    }

    open var shipCity: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.shipCity))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.shipCity, to: StringValue.of(optional: value))
        }
    }

    open var shipCountry: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.shipCountry))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.shipCountry, to: StringValue.of(optional: value))
        }
    }

    open var shipName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.shipName))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.shipName, to: StringValue.of(optional: value))
        }
    }

    open var shipPostalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.shipPostalCode))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.shipPostalCode, to: StringValue.of(optional: value))
        }
    }

    open var shipRegion: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.shipRegion))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.shipRegion, to: StringValue.of(optional: value))
        }
    }

    open var shippedDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Invoice.shippedDate))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.shippedDate, to: value)
        }
    }

    open var shipperName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Invoice.shipperName))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.shipperName, to: StringValue.of(optional: value))
        }
    }

    open var unitPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Invoice.unitPrice))
        }
        set(value) {
            self.setOptionalValue(for: Invoice.unitPrice, to: DecimalValue.of(optional: value))
        }
    }
}
