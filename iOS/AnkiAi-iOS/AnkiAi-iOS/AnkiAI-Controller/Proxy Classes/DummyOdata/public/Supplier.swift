// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Supplier: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var supplierID: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "SupplierID")

    public static var companyName: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "CompanyName")

    public static var contactName: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactName")

    public static var contactTitle: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactTitle")

    public static var address: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Address")

    public static var city: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "City")

    public static var region: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Region")

    public static var postalCode: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "PostalCode")

    public static var country: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Country")

    public static var phone: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Phone")

    public static var fax: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Fax")

    public static var homePage: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "HomePage")

    public static var products: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Products")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.supplier)
    }

    open var address: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.address))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<Supplier> {
        return ArrayConverter.convert(from.toArray(), Array<Supplier>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.city))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.city, to: StringValue.of(optional: value))
        }
    }

    open var companyName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.companyName))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.companyName, to: StringValue.of(optional: value))
        }
    }

    open var contactName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.contactName))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.contactName, to: StringValue.of(optional: value))
        }
    }

    open var contactTitle: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.contactTitle))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.contactTitle, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Supplier {
        return CastRequired<Supplier>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.country))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.country, to: StringValue.of(optional: value))
        }
    }

    open var fax: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.fax))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.fax, to: StringValue.of(optional: value))
        }
    }

    open var homePage: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.homePage))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.homePage, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(supplierID: Int?) -> EntityKey {
        return EntityKey().with(name: "SupplierID", value: IntValue.of(optional: supplierID))
    }

    open var old: Supplier {
        return CastRequired<Supplier>.from(self.oldEntity)
    }

    open var phone: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.phone))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.phone, to: StringValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.postalCode))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var products: Array<Product> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Supplier.products)).toArray(), Array<Product>())
        }
        set(value) {
            Supplier.products.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var region: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.region))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.region, to: StringValue.of(optional: value))
        }
    }

    open var supplierID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Supplier.supplierID))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.supplierID, to: IntValue.of(optional: value))
        }
    }
}
