//
//  ArticleWebAccess.swift
//  Datartisan
//
//  Created by closure on 8/18/15.
//  Copyright © 2015 datartisan. All rights reserved.
//

import Foundation
import ObjectMapper

public class AritcleWebAccess : WebAccess {
    public typealias ArticleAction = (article: Article?, error: NSError?) -> Void
    public typealias ArticlesAction = (articles: [Article]?, error: NSError?) -> Void
    
    public override class var Service : String {
        return "article/"
    }
    
    public class func Get(page: Int, count: Int, action: ArticlesAction) {
        RequestGet("list", params: ["page": page.description, "count": count.description]) { (request, response, data, error) -> Void in
            if data == nil || error != nil {
                return action(articles: nil, error: error)
            }
            do {
                guard let jsonObject : AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) else {
                    return action(articles: nil, error: error)
                }
                guard let articles = Mapper<Article>().mapArray(jsonObject) else {
                    return action(articles: nil, error: error)
                }
                return action(articles: articles, error: nil)
            } catch _ {
            }
            return
        }
    }
}
