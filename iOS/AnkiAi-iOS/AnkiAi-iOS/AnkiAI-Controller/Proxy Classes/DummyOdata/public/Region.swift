// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Region: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var regionID: Property = NorthwindEntitiesMetadata.EntityTypes.region.property(withName: "RegionID")

    public static var regionDescription: Property = NorthwindEntitiesMetadata.EntityTypes.region.property(withName: "RegionDescription")

    public static var territories: Property = NorthwindEntitiesMetadata.EntityTypes.region.property(withName: "Territories")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.region)
    }

    open class func array(from: EntityValueList) -> Array<Region> {
        return ArrayConverter.convert(from.toArray(), Array<Region>())
    }

    open func copy() -> Region {
        return CastRequired<Region>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(regionID: Int?) -> EntityKey {
        return EntityKey().with(name: "RegionID", value: IntValue.of(optional: regionID))
    }

    open var old: Region {
        return CastRequired<Region>.from(self.oldEntity)
    }

    open var regionDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Region.regionDescription))
        }
        set(value) {
            self.setOptionalValue(for: Region.regionDescription, to: StringValue.of(optional: value))
        }
    }

    open var regionID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Region.regionID))
        }
        set(value) {
            self.setOptionalValue(for: Region.regionID, to: IntValue.of(optional: value))
        }
    }

    open var territories: Array<Territory> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Region.territories)).toArray(), Array<Territory>())
        }
        set(value) {
            Region.territories.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }
}
