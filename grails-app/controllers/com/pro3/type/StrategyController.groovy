package com.pro3.type

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class StrategyController {
    static scaffold = Strategy
}
