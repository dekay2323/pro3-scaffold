package com.pro3

class Rfq {
    String name
    Vendor vendor

    Date dateCreated
    Date lastUpdated

    static belongsTo = [request: Request]
    static hasMany = [clarifications: Clarification, quotes: Quote]

    static constraints = {
        name nullable: false, blank: false, unique: true, size: 0..25
        vendor nullable: false
    }

    public String toString() {
        "${name}"
    }
}
