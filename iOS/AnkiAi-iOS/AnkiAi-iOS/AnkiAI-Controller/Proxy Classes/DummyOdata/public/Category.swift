// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Category: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var categoryID: Property = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "CategoryID")

    public static var categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "CategoryName")

    public static var description: Property = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "Description")

    public static var picture: Property = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "Picture")

    public static var products: Property = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "Products")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.category)
    }

    open class func array(from: EntityValueList) -> Array<Category> {
        return ArrayConverter.convert(from.toArray(), Array<Category>())
    }

    open var categoryID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Category.categoryID))
        }
        set(value) {
            self.setOptionalValue(for: Category.categoryID, to: IntValue.of(optional: value))
        }
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Category.categoryName))
        }
        set(value) {
            self.setOptionalValue(for: Category.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Category {
        return CastRequired<Category>.from(self.copyEntity())
    }

    open var description: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Category.description))
        }
        set(value) {
            self.setOptionalValue(for: Category.description, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(categoryID: Int?) -> EntityKey {
        return EntityKey().with(name: "CategoryID", value: IntValue.of(optional: categoryID))
    }

    open var old: Category {
        return CastRequired<Category>.from(self.oldEntity)
    }

    open var picture: Data? {
        get {
            return BinaryValue.optional(self.optionalValue(for: Category.picture))
        }
        set(value) {
            self.setOptionalValue(for: Category.picture, to: BinaryValue.of(optional: value))
        }
    }

    open var products: Array<Product> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Category.products)).toArray(), Array<Product>())
        }
        set(value) {
            Category.products.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }
}
