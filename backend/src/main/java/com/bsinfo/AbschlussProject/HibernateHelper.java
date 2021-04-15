package com.bsinfo.AbschlussProject;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Component;

import javax.persistence.criteria.CriteriaQuery;
import java.io.Serializable;
import java.util.List;

@Component
public class HibernateHelper {
    private SessionFactory factory;
    private Session session;
    Transaction tx = null;

    public HibernateHelper() {
        setupHibernate();
    }

    //maybe create entity interface for best practices
    public void saveEntity(Object entity) {
        try {
            tx = session.beginTransaction();
            session.save(entity);
            tx.commit();
            session.close();
            tx = null;
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }

    }

    public void deleteEntity(Object entity) {
        try {
            tx = session.beginTransaction();
            session.delete(entity);
            tx.commit();
            session.close();
            tx = null;
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }


    }

    public Object getEntity(Serializable id, Class classname) {
        Object entity;

        try {
            tx = session.beginTransaction();
            entity = session.get(classname, id);
            tx.commit();
            session.close();
            tx = null;
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();

            return null;
        }

        return entity;
    }

    public List getAllEntities(Class classname){
        CriteriaQuery criteria = session.getCriteriaBuilder().createQuery(classname);
        criteria.from(classname);

        return session.createQuery(criteria).getResultList();
    }

    private void setupHibernate() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
        session = factory.openSession();


    }
}
