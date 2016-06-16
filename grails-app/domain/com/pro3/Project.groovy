package com.pro3

class Project {
    String name
    Client client

    Date dateCreated
    Date lastUpdated

    static hasMany = [requests: Request]

    static constraints = {
        name nullable: false
        client nullable: false

        dateCreated nullable: false
        lastUpdated nullable: false
    }
}
