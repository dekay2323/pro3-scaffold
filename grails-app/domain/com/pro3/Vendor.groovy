package com.pro3

class Vendor {
    String name

    static hasMany = [requests: Request]
    static belongsTo = Request

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name nullable: false, blank: false, size: 0..50
    }

    public String toString() {
        "${name}"
    }
}
