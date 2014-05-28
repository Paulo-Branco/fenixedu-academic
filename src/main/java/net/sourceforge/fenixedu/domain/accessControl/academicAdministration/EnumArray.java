/**
 * Copyright © 2002 Instituto Superior Técnico
 *
 * This file is part of FenixEdu Core.
 *
 * FenixEdu Core is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FenixEdu Core is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FenixEdu Core.  If not, see <http://www.gnu.org/licenses/>.
 */
package net.sourceforge.fenixedu.domain.accessControl.academicAdministration;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

public abstract class EnumArray<T extends Enum<?>> implements Serializable {
    private final Set<T> elements;

    private static final String SEPARATOR = ";";

    public EnumArray(String serialized) {
        elements = new HashSet<T>();
        if (StringUtils.isNotBlank(serialized)) {
            for (String part : serialized.split(SEPARATOR)) {
                elements.add(resolve(part));
            }
        }
    }

    public EnumArray(Set<T> elements) {
        this.elements = elements;
    }

    protected abstract EnumArray<T> make(Set<T> elements);

    protected abstract T resolve(String serialize);

    public boolean same(Set<T> elements) {
        return CollectionUtils.isEqualCollection(this.elements, elements);
    }

    public boolean contains(Set<T> elements) {
        return this.elements.containsAll(elements);
    }

    public EnumArray<T> with(T element) {
        Set<T> newElements = new HashSet<T>(elements);
        newElements.add(element);
        return make(newElements);
    }

    public EnumArray<T> without(T element) {
        Set<T> newElements = new HashSet<T>(elements);
        newElements.remove(element);
        return make(newElements);
    }

    public Set<T> getValues() {
        return elements;
    }

    public String serialize() {
        return StringUtils.join(elements, SEPARATOR);
    }

    @Override
    public String toString() {
        return StringUtils.join(elements, ", ");
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof EnumArray) {
            return CollectionUtils.isEqualCollection(elements, ((EnumArray<T>) obj).elements);
        }
        return false;
    }

    @Override
    public int hashCode() {
        int sum = 0;
        for (T elem : elements) {
            sum = elem.hashCode();
        }
        return sum;
    }
}