package com.pro3

class Quote {
    String name

    Date dateCreated
    Date lastUpdated

    static belongsTo = [request: RequestItem]
    static hasMany = [quoteLineItems: QuoteLineItem]

    static constraints = {
        name nullable: false, blank: false, unique: true, size: 0..25
        price nullable: false, scale: 2
        shipDate nullable: false
        dateCreated display: false
        lastUpdated display: false
    }

    public String toString() {
        "${name}"
    }
}
