package com.pro3

class Company {
    String name

    Date dateCreated
    Date lastUpdated

    static hasMany = [projects: Project]

    static constraints = {
        name nullable: false, blank: false

        dateCreated nullable: false
        lastUpdated nullable: false
    }
}
