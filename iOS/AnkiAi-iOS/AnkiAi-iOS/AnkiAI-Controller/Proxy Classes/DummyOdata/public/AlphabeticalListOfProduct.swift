// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class AlphabeticalListOfProduct: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var productID: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "ProductID")

    public static var productName: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "ProductName")

    public static var supplierID: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "SupplierID")

    public static var categoryID: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "CategoryID")

    public static var quantityPerUnit: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "QuantityPerUnit")

    public static var unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "UnitPrice")

    public static var unitsInStock: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "UnitsInStock")

    public static var unitsOnOrder: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "UnitsOnOrder")

    public static var reorderLevel: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "ReorderLevel")

    public static var discontinued: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "Discontinued")

    public static var categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "CategoryName")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct)
    }

    open class func array(from: EntityValueList) -> Array<AlphabeticalListOfProduct> {
        return ArrayConverter.convert(from.toArray(), Array<AlphabeticalListOfProduct>())
    }

    open var categoryID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.categoryID))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.categoryID, to: IntValue.of(optional: value))
        }
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.categoryName))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> AlphabeticalListOfProduct {
        return CastRequired<AlphabeticalListOfProduct>.from(self.copyEntity())
    }

    open var discontinued: Bool? {
        get {
            return BooleanValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.discontinued))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.discontinued, to: BooleanValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(categoryName: String?, discontinued: Bool?, productID: Int?, productName: String?) -> EntityKey {
        return EntityKey().with(name: "CategoryName", value: StringValue.of(optional: categoryName)).with(name: "Discontinued", value: BooleanValue.of(optional: discontinued)).with(name: "ProductID", value: IntValue.of(optional: productID)).with(name: "ProductName", value: StringValue.of(optional: productName))
    }

    open var old: AlphabeticalListOfProduct {
        return CastRequired<AlphabeticalListOfProduct>.from(self.oldEntity)
    }

    open var productID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.productID))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.productID, to: IntValue.of(optional: value))
        }
    }

    open var productName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.productName))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.productName, to: StringValue.of(optional: value))
        }
    }

    open var quantityPerUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.quantityPerUnit))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.quantityPerUnit, to: StringValue.of(optional: value))
        }
    }

    open var reorderLevel: Int? {
        get {
            return ShortValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.reorderLevel))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.reorderLevel, to: ShortValue.of(optional: value))
        }
    }

    open var supplierID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.supplierID))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.supplierID, to: IntValue.of(optional: value))
        }
    }

    open var unitPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.unitPrice))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.unitPrice, to: DecimalValue.of(optional: value))
        }
    }

    open var unitsInStock: Int? {
        get {
            return ShortValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.unitsInStock))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.unitsInStock, to: ShortValue.of(optional: value))
        }
    }

    open var unitsOnOrder: Int? {
        get {
            return ShortValue.optional(self.optionalValue(for: AlphabeticalListOfProduct.unitsOnOrder))
        }
        set(value) {
            self.setOptionalValue(for: AlphabeticalListOfProduct.unitsOnOrder, to: ShortValue.of(optional: value))
        }
    }
}
