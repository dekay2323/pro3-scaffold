package com.pro3.scaffold.type

class RequestStatus {
    String name

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name nullable: false, blank: false, unique: true, size: 0..25
    }

    public String toString() {
        "${name}"
    }
}
