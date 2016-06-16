package com.pro3

class Vendor {
    String name

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name nullable: false, blank: false
    }

    public String toString() {
        "${name}"
    }
}