// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

internal class NorthwindEntitiesMetadataParser {
    internal static let options: Int = (CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = NorthwindEntitiesMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = NorthwindEntitiesMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(NorthwindEntitiesMetadataText.xml, url: "ODataWebV3.Northwind.Model")
        metadata.proxyVersion = "17.12.4-8c3504-20180321"
        return metadata
    }
}
