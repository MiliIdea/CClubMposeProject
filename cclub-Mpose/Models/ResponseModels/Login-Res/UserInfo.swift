/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct UserInfo : Codable {
	let userId : Int?
	let organizationId : Int?
	let personId : Int?
	let active : Bool?
	let roleId : Int?
	let ticket : String?
	let expireMinute : Int?
	let userRoleId : Int?
	let fileId : Int?

	enum CodingKeys: String, CodingKey {

		case userId = "userId"
		case organizationId = "organizationId"
		case personId = "personId"
		case active = "active"
		case roleId = "roleId"
		case ticket = "ticket"
		case expireMinute = "expireMinute"
		case userRoleId = "userRoleId"
		case fileId = "fileId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		organizationId = try values.decodeIfPresent(Int.self, forKey: .organizationId)
		personId = try values.decodeIfPresent(Int.self, forKey: .personId)
		active = try values.decodeIfPresent(Bool.self, forKey: .active)
		roleId = try values.decodeIfPresent(Int.self, forKey: .roleId)
		ticket = try values.decodeIfPresent(String.self, forKey: .ticket)
		expireMinute = try values.decodeIfPresent(Int.self, forKey: .expireMinute)
		userRoleId = try values.decodeIfPresent(Int.self, forKey: .userRoleId)
		fileId = try values.decodeIfPresent(Int.self, forKey: .fileId)
	}

}