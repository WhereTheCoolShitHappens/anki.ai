// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Product: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var productID: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "ProductID")

    public static var productName: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "ProductName")

    public static var supplierID: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "SupplierID")

    public static var categoryID: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "CategoryID")

    public static var quantityPerUnit: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "QuantityPerUnit")

    public static var unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "UnitPrice")

    public static var unitsInStock: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "UnitsInStock")

    public static var unitsOnOrder: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "UnitsOnOrder")

    public static var reorderLevel: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "ReorderLevel")

    public static var discontinued: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Discontinued")

    public static var category: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Category")

    public static var orderDetails: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Order_Details")

    public static var supplier: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Supplier")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.product)
    }

    open class func array(from: EntityValueList) -> Array<Product> {
        return ArrayConverter.convert(from.toArray(), Array<Product>())
    }

    open var category: Category? {
        get {
            return CastOptional<Category>.from(self.optionalValue(for: Product.category))
        }
        set(value) {
            self.setOptionalValue(for: Product.category, to: value)
        }
    }

    open var categoryID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Product.categoryID))
        }
        set(value) {
            self.setOptionalValue(for: Product.categoryID, to: IntValue.of(optional: value))
        }
    }

    open func copy() -> Product {
        return CastRequired<Product>.from(self.copyEntity())
    }

    open var discontinued: Bool? {
        get {
            return BooleanValue.optional(self.optionalValue(for: Product.discontinued))
        }
        set(value) {
            self.setOptionalValue(for: Product.discontinued, to: BooleanValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(productID: Int?) -> EntityKey {
        return EntityKey().with(name: "ProductID", value: IntValue.of(optional: productID))
    }

    open var old: Product {
        return CastRequired<Product>.from(self.oldEntity)
    }

    open var orderDetails: Array<OrderDetail> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Product.orderDetails)).toArray(), Array<OrderDetail>())
        }
        set(value) {
            Product.orderDetails.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var productID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Product.productID))
        }
        set(value) {
            self.setOptionalValue(for: Product.productID, to: IntValue.of(optional: value))
        }
    }

    open var productName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.productName))
        }
        set(value) {
            self.setOptionalValue(for: Product.productName, to: StringValue.of(optional: value))
        }
    }

    open var quantityPerUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.quantityPerUnit))
        }
        set(value) {
            self.setOptionalValue(for: Product.quantityPerUnit, to: StringValue.of(optional: value))
        }
    }

    open var reorderLevel: Int? {
        get {
            return ShortValue.optional(self.optionalValue(for: Product.reorderLevel))
        }
        set(value) {
            self.setOptionalValue(for: Product.reorderLevel, to: ShortValue.of(optional: value))
        }
    }

    open var supplier: Supplier? {
        get {
            return CastOptional<Supplier>.from(self.optionalValue(for: Product.supplier))
        }
        set(value) {
            self.setOptionalValue(for: Product.supplier, to: value)
        }
    }

    open var supplierID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Product.supplierID))
        }
        set(value) {
            self.setOptionalValue(for: Product.supplierID, to: IntValue.of(optional: value))
        }
    }

    open var unitPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.unitPrice))
        }
        set(value) {
            self.setOptionalValue(for: Product.unitPrice, to: DecimalValue.of(optional: value))
        }
    }

    open var unitsInStock: Int? {
        get {
            return ShortValue.optional(self.optionalValue(for: Product.unitsInStock))
        }
        set(value) {
            self.setOptionalValue(for: Product.unitsInStock, to: ShortValue.of(optional: value))
        }
    }

    open var unitsOnOrder: Int? {
        get {
            return ShortValue.optional(self.optionalValue(for: Product.unitsOnOrder))
        }
        set(value) {
            self.setOptionalValue(for: Product.unitsOnOrder, to: ShortValue.of(optional: value))
        }
    }
}
