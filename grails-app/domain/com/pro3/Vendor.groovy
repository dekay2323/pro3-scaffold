package com.pro3

class Vendor {
    String name

    static hasMany = [requests: RequestItem]
    static belongsTo = RequestItem

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name nullable: false, blank: false, size: 0..50
        dateCreated display: false
        lastUpdated display: false
    }

    public String toString() {
        "${name}"
    }
}
