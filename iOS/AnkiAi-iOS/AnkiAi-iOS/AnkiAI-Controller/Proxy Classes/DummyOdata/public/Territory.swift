// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Territory: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var territoryID: Property = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "TerritoryID")

    public static var territoryDescription: Property = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "TerritoryDescription")

    public static var regionID: Property = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "RegionID")

    public static var region: Property = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "Region")

    public static var employees: Property = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "Employees")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.territory)
    }

    open class func array(from: EntityValueList) -> Array<Territory> {
        return ArrayConverter.convert(from.toArray(), Array<Territory>())
    }

    open func copy() -> Territory {
        return CastRequired<Territory>.from(self.copyEntity())
    }

    open var employees: Array<Employee> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Territory.employees)).toArray(), Array<Employee>())
        }
        set(value) {
            Territory.employees.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(territoryID: String?) -> EntityKey {
        return EntityKey().with(name: "TerritoryID", value: StringValue.of(optional: territoryID))
    }

    open var old: Territory {
        return CastRequired<Territory>.from(self.oldEntity)
    }

    open var region: Region? {
        get {
            return CastOptional<Region>.from(self.optionalValue(for: Territory.region))
        }
        set(value) {
            self.setOptionalValue(for: Territory.region, to: value)
        }
    }

    open var regionID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Territory.regionID))
        }
        set(value) {
            self.setOptionalValue(for: Territory.regionID, to: IntValue.of(optional: value))
        }
    }

    open var territoryDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Territory.territoryDescription))
        }
        set(value) {
            self.setOptionalValue(for: Territory.territoryDescription, to: StringValue.of(optional: value))
        }
    }

    open var territoryID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Territory.territoryID))
        }
        set(value) {
            self.setOptionalValue(for: Territory.territoryID, to: StringValue.of(optional: value))
        }
    }
}
