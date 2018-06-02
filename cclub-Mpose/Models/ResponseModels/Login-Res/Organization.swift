/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Organization : Codable {
	let createdBy : CreatedBy?
	let created : String?
	let updatedBy : UpdatedBy?
	let updated : String?
	let accessKey : String?
	let active : Bool?
	let fullTitle : String?
	let rowId : Int?
	let name : String?
	let establishingYear : Int?
	let ownerLastName : String?
	let parentOrg : ParentOrg?
	let tel : Int?
	let address : String?
	let code : Int?
	let logoImage : LogoImage?
	let email : String?
	let mobileNumber : Int?
	let marketerFirstName : String?
	let marketerLastName : String?
	let marketerCode : Int?
	let marketerMobile : Int?

	enum CodingKeys: String, CodingKey {

		case createdBy
		case created = "created"
		case updatedBy
		case updated = "updated"
		case accessKey = "accessKey"
		case active = "active"
		case fullTitle = "fullTitle"
		case rowId = "rowId"
		case name = "name"
		case establishingYear = "establishingYear"
		case ownerLastName = "ownerLastName"
		case parentOrg
		case tel = "tel"
		case address = "address"
		case code = "code"
		case logoImage
		case email = "email"
		case mobileNumber = "mobileNumber"
		case marketerFirstName = "marketerFirstName"
		case marketerLastName = "marketerLastName"
		case marketerCode = "marketerCode"
		case marketerMobile = "marketerMobile"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		createdBy = try CreatedBy(from: decoder)
		created = try values.decodeIfPresent(String.self, forKey: .created)
		updatedBy = try UpdatedBy(from: decoder)
		updated = try values.decodeIfPresent(String.self, forKey: .updated)
		accessKey = try values.decodeIfPresent(String.self, forKey: .accessKey)
		active = try values.decodeIfPresent(Bool.self, forKey: .active)
		fullTitle = try values.decodeIfPresent(String.self, forKey: .fullTitle)
		rowId = try values.decodeIfPresent(Int.self, forKey: .rowId)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		establishingYear = try values.decodeIfPresent(Int.self, forKey: .establishingYear)
		ownerLastName = try values.decodeIfPresent(String.self, forKey: .ownerLastName)
		parentOrg = try ParentOrg(from: decoder)
		tel = try values.decodeIfPresent(Int.self, forKey: .tel)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		logoImage = try LogoImage(from: decoder)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		mobileNumber = try values.decodeIfPresent(Int.self, forKey: .mobileNumber)
		marketerFirstName = try values.decodeIfPresent(String.self, forKey: .marketerFirstName)
		marketerLastName = try values.decodeIfPresent(String.self, forKey: .marketerLastName)
		marketerCode = try values.decodeIfPresent(Int.self, forKey: .marketerCode)
		marketerMobile = try values.decodeIfPresent(Int.self, forKey: .marketerMobile)
	}

}