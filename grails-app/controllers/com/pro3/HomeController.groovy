package com.pro3

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class HomeController {

    static allowedMethods = []

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond (Project.list(params), model:[projectCount: Project.count()], view:'procurementStats')
    }

}
