package com.pro3

class Project {
    String projectNumber
    String name
    Client client

    Date dateCreated
    Date lastUpdated

    static hasMany = [requests: Request]

    static constraints = {
        projectNumber nullable: false, size: 0..25
        name nullable: false, size: 0..50
        client nullable: false
        dateCreated display: false
        lastUpdated display: false
    }

    public String toString() {
        "${name}"
    }
}
