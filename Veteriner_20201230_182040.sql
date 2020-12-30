--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: Personel; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Personel";


ALTER SCHEMA "Personel" OWNER TO postgres;

--
-- Name: asiDegisikligiTR1(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."asiDegisikligiTR1"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."asiUcreti" <> OLD."asiUcreti" THEN
        INSERT INTO "AsiDegisikligiIzle"("asiNo1", "eskiUcret", "yeniUcret", "degisiklikTarihi")
        VALUES(OLD."asiNo", OLD."asiUcreti", NEW."asiUcreti", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."asiDegisikligiTR1"() OWNER TO postgres;

--
-- Name: ilacTurDegisikligiTR1(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ilacTurDegisikligiTR1"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."ilacUcret" <> OLD."ilacUcret" THEN
        INSERT INTO "IlacTurDegisikligiIzle"("ilacTurNo1", "eskiUcret", "yeniUcret", "degisiklikTarihi")
        VALUES(OLD."turNo", OLD."ilacUcret", NEW."ilacUcret", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."ilacTurDegisikligiTR1"() OWNER TO postgres;

--
-- Name: kdvhesapla(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kdvhesapla(fatno integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
Declare
 sonuc DECIMAL(10,2);
  ucret DECIMAL(10,2);
 fNo integer;
BEGIN
ucret:=(select "faturaUcreti" from "Fatura" where "faturaNo"=fatNo);
 sonuc:=ucret*0.18;
return sonuc;

end;
$$;


ALTER FUNCTION public.kdvhesapla(fatno integer) OWNER TO postgres;

--
-- Name: kdvlitoplam(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kdvlitoplam(fatno integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
Declare
 sonuc DECIMAL(10,2);
  ucret DECIMAL(10,2);
 fNo integer;
BEGIN
ucret:=(select "faturaUcreti" from "Fatura" where "faturaNo"=fatNo);
 sonuc:=ucret*1.18;
return sonuc;

end;
$$;


ALTER FUNCTION public.kdvlitoplam(fatno integer) OWNER TO postgres;

--
-- Name: test1(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.test1() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
 DECLARE        
    ucret integer;
    no integer;
    hNo integer;
  begin
  no:=(select "testNo" from "HayvanTestYapma" order by "hayvanTestNo" desc limit 1);
  hNo:=(select "hayvanNo" from "HayvanTestYapma" order by "hayvanTestNo" desc limit 1);
  ucret:=(Select "testUcreti" from "Test" where  "testNo"=no);
  update "Fatura" set "faturaUcreti"="faturaUcreti"+ucret  where "hayvanNo"=hNo;
  return new;
  end;
  $$;


ALTER FUNCTION public.test1() OWNER TO postgres;

--
-- Name: testDegisikligiTR1(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."testDegisikligiTR1"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."testUcreti" <> OLD."testUcreti" THEN
        INSERT INTO "TestDegisikligiIzle"("testNo1", "eskiUcret", "yeniUcret", "degisiklikTarihi")
        VALUES(OLD."testNo", OLD."testUcreti", NEW."testUcreti", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."testDegisikligiTR1"() OWNER TO postgres;

--
-- Name: testsilme(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.testsilme() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
 DECLARE        
    ucret integer;
    no integer;
    hNo integer;
  begin
  no:=(select "testNo" from "HayvanTestYapma" order by "hayvanTestNo" desc limit 1);
  hNo:=(select "hayvanNo" from "HayvanTestYapma" order by "hayvanTestNo" desc limit 1);
  ucret:=(Select "testUcreti" from "Test" where  "testNo"=no);
  update "Fatura" set "faturaUcreti"="faturaUcreti"-ucret  where "hayvanNo"=hNo;
  return new;
  end;
  $$;


ALTER FUNCTION public.testsilme() OWNER TO postgres;

--
-- Name: toplam(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplam(ay integer, maas integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    sonuc integer;
BEGIN
        sonuc=ay*maas;
        return sonuc;
End;
$$;


ALTER FUNCTION public.toplam(ay integer, maas integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Personel; Type: TABLE; Schema: Personel; Owner: postgres
--

CREATE TABLE "Personel"."Personel" (
    "personelNo" integer NOT NULL,
    adi character varying(40) NOT NULL,
    soyadi character varying(40) NOT NULL,
    "personelTipi" character(1) NOT NULL,
    "baslamaTarihi" timestamp without time zone,
    "telNo" character varying(11),
    "ePosta" character varying(40),
    adres text
);


ALTER TABLE "Personel"."Personel" OWNER TO postgres;

--
-- Name: Personel_personelNo_seq; Type: SEQUENCE; Schema: Personel; Owner: postgres
--

CREATE SEQUENCE "Personel"."Personel_personelNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Personel"."Personel_personelNo_seq" OWNER TO postgres;

--
-- Name: Personel_personelNo_seq; Type: SEQUENCE OWNED BY; Schema: Personel; Owner: postgres
--

ALTER SEQUENCE "Personel"."Personel_personelNo_seq" OWNED BY "Personel"."Personel"."personelNo";


--
-- Name: Stajyer; Type: TABLE; Schema: Personel; Owner: postgres
--

CREATE TABLE "Personel"."Stajyer" (
    "personelNo" integer NOT NULL,
    "stajSuresi" integer,
    "stajNotu" text
);


ALTER TABLE "Personel"."Stajyer" OWNER TO postgres;

--
-- Name: Veteriner; Type: TABLE; Schema: Personel; Owner: postgres
--

CREATE TABLE "Personel"."Veteriner" (
    "personelNo" integer NOT NULL,
    maas integer,
    "yillikIzin" integer,
    "mezuniyetTarihi" timestamp without time zone,
    "mezunOkul" character varying
);


ALTER TABLE "Personel"."Veteriner" OWNER TO postgres;

--
-- Name: Asi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Asi" (
    "asiNo" integer NOT NULL,
    "asiAdi" character varying(20),
    "asiUcreti" integer
);


ALTER TABLE public."Asi" OWNER TO postgres;

--
-- Name: AsiDegisikligiIzle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AsiDegisikligiIzle" (
    "kayitNo1" integer NOT NULL,
    "asiNo1" integer NOT NULL,
    "eskiUcret" integer NOT NULL,
    "yeniUcret" integer NOT NULL,
    "degisiklikTarihi" timestamp without time zone NOT NULL
);


ALTER TABLE public."AsiDegisikligiIzle" OWNER TO postgres;

--
-- Name: AsiDegisikligiIzle_kayitNo1_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."AsiDegisikligiIzle_kayitNo1_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AsiDegisikligiIzle_kayitNo1_seq" OWNER TO postgres;

--
-- Name: AsiDegisikligiIzle_kayitNo1_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."AsiDegisikligiIzle_kayitNo1_seq" OWNED BY public."AsiDegisikligiIzle"."kayitNo1";


--
-- Name: Fatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fatura" (
    "faturaNo" integer NOT NULL,
    "faturaKDV" integer,
    "faturaUcreti" integer,
    "faturaTarihi" timestamp without time zone,
    "hayvanNo" integer,
    "Toplam" integer
);


ALTER TABLE public."Fatura" OWNER TO postgres;

--
-- Name: Fatura_faturaNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Fatura_faturaNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Fatura_faturaNo_seq" OWNER TO postgres;

--
-- Name: Fatura_faturaNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Fatura_faturaNo_seq" OWNED BY public."Fatura"."faturaNo";


--
-- Name: Hayvan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Hayvan" (
    "hayvanNo" integer NOT NULL,
    "sahipNo" integer,
    "hayvanAdi" character varying(40) NOT NULL,
    "hayvanYasi" integer,
    "cinsNo" integer,
    ates real,
    "veterinerNo" integer NOT NULL,
    cinsiyet character(1)
);


ALTER TABLE public."Hayvan" OWNER TO postgres;

--
-- Name: HayvanAsiOlma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HayvanAsiOlma" (
    "hayvanAsiNo" integer NOT NULL,
    "hayvanNo" integer,
    "asiNo" integer
);


ALTER TABLE public."HayvanAsiOlma" OWNER TO postgres;

--
-- Name: HayvanAsiOlma_hayvanAsiNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HayvanAsiOlma_hayvanAsiNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."HayvanAsiOlma_hayvanAsiNo_seq" OWNER TO postgres;

--
-- Name: HayvanAsiOlma_hayvanAsiNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HayvanAsiOlma_hayvanAsiNo_seq" OWNED BY public."HayvanAsiOlma"."hayvanAsiNo";


--
-- Name: HayvanCinsi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HayvanCinsi" (
    "cinsNo" integer NOT NULL,
    "cinsAdi" character varying(40) NOT NULL,
    "turNo" integer NOT NULL
);


ALTER TABLE public."HayvanCinsi" OWNER TO postgres;

--
-- Name: HayvanCinsi_cinsNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HayvanCinsi_cinsNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."HayvanCinsi_cinsNo_seq" OWNER TO postgres;

--
-- Name: HayvanCinsi_cinsNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HayvanCinsi_cinsNo_seq" OWNED BY public."HayvanCinsi"."cinsNo";


--
-- Name: HayvanMuayneYapma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HayvanMuayneYapma" (
    "hayvanMuayneNo" integer NOT NULL,
    "muayneNo" integer NOT NULL,
    "hayvanNo" integer NOT NULL,
    "muayneTarihi" date NOT NULL
);


ALTER TABLE public."HayvanMuayneYapma" OWNER TO postgres;

--
-- Name: HayvanMuayneYapma_hayvanMuayneNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HayvanMuayneYapma_hayvanMuayneNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."HayvanMuayneYapma_hayvanMuayneNo_seq" OWNER TO postgres;

--
-- Name: HayvanMuayneYapma_hayvanMuayneNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HayvanMuayneYapma_hayvanMuayneNo_seq" OWNED BY public."HayvanMuayneYapma"."hayvanMuayneNo";


--
-- Name: HayvanSahip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HayvanSahip" (
    "sahipNo" integer NOT NULL,
    adi character varying(40) NOT NULL,
    soyadi character varying(40) NOT NULL,
    "telNo" character varying,
    adres text
);


ALTER TABLE public."HayvanSahip" OWNER TO postgres;

--
-- Name: HayvanSahip_sahipNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HayvanSahip_sahipNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."HayvanSahip_sahipNo_seq" OWNER TO postgres;

--
-- Name: HayvanSahip_sahipNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HayvanSahip_sahipNo_seq" OWNED BY public."HayvanSahip"."sahipNo";


--
-- Name: HayvanSemptom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HayvanSemptom" (
    "hayvanSemptomNo" integer NOT NULL,
    "semptomNo" integer,
    "hayvanNo" integer,
    suresi integer
);


ALTER TABLE public."HayvanSemptom" OWNER TO postgres;

--
-- Name: HayvanSemptom_hayvanSemptomNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HayvanSemptom_hayvanSemptomNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."HayvanSemptom_hayvanSemptomNo_seq" OWNER TO postgres;

--
-- Name: HayvanSemptom_hayvanSemptomNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HayvanSemptom_hayvanSemptomNo_seq" OWNED BY public."HayvanSemptom"."hayvanSemptomNo";


--
-- Name: HayvanTedaviOlma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HayvanTedaviOlma" (
    "hayvanTedaviNo" integer NOT NULL,
    "hayvanNo" integer,
    "tedaviNo" integer,
    "tedaviTarihi" timestamp without time zone
);


ALTER TABLE public."HayvanTedaviOlma" OWNER TO postgres;

--
-- Name: HayvanTedaviOlma_hayvanTedaviNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HayvanTedaviOlma_hayvanTedaviNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."HayvanTedaviOlma_hayvanTedaviNo_seq" OWNER TO postgres;

--
-- Name: HayvanTedaviOlma_hayvanTedaviNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HayvanTedaviOlma_hayvanTedaviNo_seq" OWNED BY public."HayvanTedaviOlma"."hayvanTedaviNo";


--
-- Name: HayvanTeshisYapma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HayvanTeshisYapma" (
    "hayvanTeshisNo" integer NOT NULL,
    "teshisNo" integer,
    "hayvanNo" integer,
    tarihi timestamp without time zone
);


ALTER TABLE public."HayvanTeshisYapma" OWNER TO postgres;

--
-- Name: HayvanTeshisYapma_hayvanTeshisNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HayvanTeshisYapma_hayvanTeshisNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."HayvanTeshisYapma_hayvanTeshisNo_seq" OWNER TO postgres;

--
-- Name: HayvanTeshisYapma_hayvanTeshisNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HayvanTeshisYapma_hayvanTeshisNo_seq" OWNED BY public."HayvanTeshisYapma"."hayvanTeshisNo";


--
-- Name: HayvanTestYapma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HayvanTestYapma" (
    "hayvanTestNo" integer NOT NULL,
    "hayvanNo" integer,
    "testNo" integer,
    "testTarihi" integer
);


ALTER TABLE public."HayvanTestYapma" OWNER TO postgres;

--
-- Name: HayvanTestYapma_hayvanTestNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HayvanTestYapma_hayvanTestNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."HayvanTestYapma_hayvanTestNo_seq" OWNER TO postgres;

--
-- Name: HayvanTestYapma_hayvanTestNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HayvanTestYapma_hayvanTestNo_seq" OWNED BY public."HayvanTestYapma"."hayvanTestNo";


--
-- Name: HayvanTuru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HayvanTuru" (
    "turNo" integer NOT NULL,
    "turAdi" character varying(40) NOT NULL
);


ALTER TABLE public."HayvanTuru" OWNER TO postgres;

--
-- Name: Hayvan_hayvanNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Hayvan_hayvanNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Hayvan_hayvanNo_seq" OWNER TO postgres;

--
-- Name: Hayvan_hayvanNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Hayvan_hayvanNo_seq" OWNED BY public."Hayvan"."hayvanNo";


--
-- Name: Ilac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ilac" (
    "ilacNo" integer NOT NULL,
    "turNo" integer,
    aciklama text
);


ALTER TABLE public."Ilac" OWNER TO postgres;

--
-- Name: IlacTur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IlacTur" (
    "turNo" integer NOT NULL,
    "ilacınAdi" character varying,
    "ilacDoz" integer,
    "ilacUcret" integer
);


ALTER TABLE public."IlacTur" OWNER TO postgres;

--
-- Name: IlacTurDegisikligiIzle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IlacTurDegisikligiIzle" (
    "kayitNo1" integer NOT NULL,
    "ilacTurNo1" integer NOT NULL,
    "eskiUcret" integer NOT NULL,
    "yeniUcret" integer NOT NULL,
    "degisiklikTarihi" timestamp without time zone NOT NULL
);


ALTER TABLE public."IlacTurDegisikligiIzle" OWNER TO postgres;

--
-- Name: IlacTurDegisikligiIzle_kayitNo1_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."IlacTurDegisikligiIzle_kayitNo1_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."IlacTurDegisikligiIzle_kayitNo1_seq" OWNER TO postgres;

--
-- Name: IlacTurDegisikligiIzle_kayitNo1_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."IlacTurDegisikligiIzle_kayitNo1_seq" OWNED BY public."IlacTurDegisikligiIzle"."kayitNo1";


--
-- Name: Ilac_ilacNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ilac_ilacNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ilac_ilacNo_seq" OWNER TO postgres;

--
-- Name: Ilac_ilacNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ilac_ilacNo_seq" OWNED BY public."Ilac"."ilacNo";


--
-- Name: Muayne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Muayne" (
    "muayneNo" integer NOT NULL,
    "muayneTarihi" timestamp without time zone,
    "turNo" integer
);


ALTER TABLE public."Muayne" OWNER TO postgres;

--
-- Name: MuayneTuru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MuayneTuru" (
    "turNo" integer NOT NULL,
    "turAdi" character varying(40)
);


ALTER TABLE public."MuayneTuru" OWNER TO postgres;

--
-- Name: Muayne_muayneNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Muayne_muayneNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Muayne_muayneNo_seq" OWNER TO postgres;

--
-- Name: Muayne_muayneNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Muayne_muayneNo_seq" OWNED BY public."Muayne"."muayneNo";


--
-- Name: Randevu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Randevu" (
    "randevuNo" integer NOT NULL,
    "randevuTarihi" date,
    "randevuSaati" time without time zone,
    "hayvanNo" integer
);


ALTER TABLE public."Randevu" OWNER TO postgres;

--
-- Name: Randevu_randevuNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Randevu_randevuNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Randevu_randevuNo_seq" OWNER TO postgres;

--
-- Name: Randevu_randevuNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Randevu_randevuNo_seq" OWNED BY public."Randevu"."randevuNo";


--
-- Name: Recete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recete" (
    "receteNo" integer NOT NULL,
    "hayvanNo" integer,
    "yazılmaTarihi" timestamp without time zone,
    aciklama text
);


ALTER TABLE public."Recete" OWNER TO postgres;

--
-- Name: ReceteIlacBulundurma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ReceteIlacBulundurma" (
    "receteIlacNo" integer NOT NULL,
    "receteNo" integer,
    "ilacNo" integer
);


ALTER TABLE public."ReceteIlacBulundurma" OWNER TO postgres;

--
-- Name: ReceteIlacBulundurma_receteIlacNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ReceteIlacBulundurma_receteIlacNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ReceteIlacBulundurma_receteIlacNo_seq" OWNER TO postgres;

--
-- Name: ReceteIlacBulundurma_receteIlacNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ReceteIlacBulundurma_receteIlacNo_seq" OWNED BY public."ReceteIlacBulundurma"."receteIlacNo";


--
-- Name: Recete_receteNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Recete_receteNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Recete_receteNo_seq" OWNER TO postgres;

--
-- Name: Recete_receteNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Recete_receteNo_seq" OWNED BY public."Recete"."receteNo";


--
-- Name: Semptom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Semptom" (
    "semptomNo" integer NOT NULL,
    "semptomAdi" character varying,
    "semptomAciklama" text
);


ALTER TABLE public."Semptom" OWNER TO postgres;

--
-- Name: Semptom_semptomNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Semptom_semptomNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Semptom_semptomNo_seq" OWNER TO postgres;

--
-- Name: Semptom_semptomNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Semptom_semptomNo_seq" OWNED BY public."Semptom"."semptomNo";


--
-- Name: Tedavi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tedavi" (
    "tedaviNo" integer NOT NULL,
    "turNo" integer,
    "tedaviAcıklaması" text
);


ALTER TABLE public."Tedavi" OWNER TO postgres;

--
-- Name: TedaviTuru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TedaviTuru" (
    "turNo" integer NOT NULL,
    "turAdi" character varying,
    ucreti integer
);


ALTER TABLE public."TedaviTuru" OWNER TO postgres;

--
-- Name: Tedavi_tedaviNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tedavi_tedaviNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tedavi_tedaviNo_seq" OWNER TO postgres;

--
-- Name: Tedavi_tedaviNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tedavi_tedaviNo_seq" OWNED BY public."Tedavi"."tedaviNo";


--
-- Name: Teshis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Teshis" (
    "teshisNo" integer NOT NULL,
    adi character varying(40),
    aciklama text
);


ALTER TABLE public."Teshis" OWNER TO postgres;

--
-- Name: Teshis_teshisNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Teshis_teshisNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Teshis_teshisNo_seq" OWNER TO postgres;

--
-- Name: Teshis_teshisNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Teshis_teshisNo_seq" OWNED BY public."Teshis"."teshisNo";


--
-- Name: Test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Test" (
    "testNo" integer NOT NULL,
    "testAdi" character varying(40),
    "testUcreti" integer
);


ALTER TABLE public."Test" OWNER TO postgres;

--
-- Name: TestDegisikligiIzle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TestDegisikligiIzle" (
    "kayitNo" integer NOT NULL,
    "testNo1" integer NOT NULL,
    "eskiUcret" integer NOT NULL,
    "yeniUcret" integer NOT NULL,
    "degisiklikTarihi" timestamp without time zone NOT NULL
);


ALTER TABLE public."TestDegisikligiIzle" OWNER TO postgres;

--
-- Name: TestDegisikligiIzle_kayitNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TestDegisikligiIzle_kayitNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TestDegisikligiIzle_kayitNo_seq" OWNER TO postgres;

--
-- Name: TestDegisikligiIzle_kayitNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TestDegisikligiIzle_kayitNo_seq" OWNED BY public."TestDegisikligiIzle"."kayitNo";


--
-- Name: Personel personelNo; Type: DEFAULT; Schema: Personel; Owner: postgres
--

ALTER TABLE ONLY "Personel"."Personel" ALTER COLUMN "personelNo" SET DEFAULT nextval('"Personel"."Personel_personelNo_seq"'::regclass);


--
-- Name: AsiDegisikligiIzle kayitNo1; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AsiDegisikligiIzle" ALTER COLUMN "kayitNo1" SET DEFAULT nextval('public."AsiDegisikligiIzle_kayitNo1_seq"'::regclass);


--
-- Name: Fatura faturaNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fatura" ALTER COLUMN "faturaNo" SET DEFAULT nextval('public."Fatura_faturaNo_seq"'::regclass);


--
-- Name: Hayvan hayvanNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hayvan" ALTER COLUMN "hayvanNo" SET DEFAULT nextval('public."Hayvan_hayvanNo_seq"'::regclass);


--
-- Name: HayvanAsiOlma hayvanAsiNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanAsiOlma" ALTER COLUMN "hayvanAsiNo" SET DEFAULT nextval('public."HayvanAsiOlma_hayvanAsiNo_seq"'::regclass);


--
-- Name: HayvanCinsi cinsNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanCinsi" ALTER COLUMN "cinsNo" SET DEFAULT nextval('public."HayvanCinsi_cinsNo_seq"'::regclass);


--
-- Name: HayvanMuayneYapma hayvanMuayneNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanMuayneYapma" ALTER COLUMN "hayvanMuayneNo" SET DEFAULT nextval('public."HayvanMuayneYapma_hayvanMuayneNo_seq"'::regclass);


--
-- Name: HayvanSahip sahipNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanSahip" ALTER COLUMN "sahipNo" SET DEFAULT nextval('public."HayvanSahip_sahipNo_seq"'::regclass);


--
-- Name: HayvanSemptom hayvanSemptomNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanSemptom" ALTER COLUMN "hayvanSemptomNo" SET DEFAULT nextval('public."HayvanSemptom_hayvanSemptomNo_seq"'::regclass);


--
-- Name: HayvanTedaviOlma hayvanTedaviNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTedaviOlma" ALTER COLUMN "hayvanTedaviNo" SET DEFAULT nextval('public."HayvanTedaviOlma_hayvanTedaviNo_seq"'::regclass);


--
-- Name: HayvanTeshisYapma hayvanTeshisNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTeshisYapma" ALTER COLUMN "hayvanTeshisNo" SET DEFAULT nextval('public."HayvanTeshisYapma_hayvanTeshisNo_seq"'::regclass);


--
-- Name: HayvanTestYapma hayvanTestNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTestYapma" ALTER COLUMN "hayvanTestNo" SET DEFAULT nextval('public."HayvanTestYapma_hayvanTestNo_seq"'::regclass);


--
-- Name: Ilac ilacNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilac" ALTER COLUMN "ilacNo" SET DEFAULT nextval('public."Ilac_ilacNo_seq"'::regclass);


--
-- Name: IlacTurDegisikligiIzle kayitNo1; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IlacTurDegisikligiIzle" ALTER COLUMN "kayitNo1" SET DEFAULT nextval('public."IlacTurDegisikligiIzle_kayitNo1_seq"'::regclass);


--
-- Name: Muayne muayneNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Muayne" ALTER COLUMN "muayneNo" SET DEFAULT nextval('public."Muayne_muayneNo_seq"'::regclass);


--
-- Name: Randevu randevuNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Randevu" ALTER COLUMN "randevuNo" SET DEFAULT nextval('public."Randevu_randevuNo_seq"'::regclass);


--
-- Name: Recete receteNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recete" ALTER COLUMN "receteNo" SET DEFAULT nextval('public."Recete_receteNo_seq"'::regclass);


--
-- Name: ReceteIlacBulundurma receteIlacNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceteIlacBulundurma" ALTER COLUMN "receteIlacNo" SET DEFAULT nextval('public."ReceteIlacBulundurma_receteIlacNo_seq"'::regclass);


--
-- Name: Semptom semptomNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Semptom" ALTER COLUMN "semptomNo" SET DEFAULT nextval('public."Semptom_semptomNo_seq"'::regclass);


--
-- Name: Tedavi tedaviNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tedavi" ALTER COLUMN "tedaviNo" SET DEFAULT nextval('public."Tedavi_tedaviNo_seq"'::regclass);


--
-- Name: Teshis teshisNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Teshis" ALTER COLUMN "teshisNo" SET DEFAULT nextval('public."Teshis_teshisNo_seq"'::regclass);


--
-- Name: TestDegisikligiIzle kayitNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TestDegisikligiIzle" ALTER COLUMN "kayitNo" SET DEFAULT nextval('public."TestDegisikligiIzle_kayitNo_seq"'::regclass);


--
-- Data for Name: Personel; Type: TABLE DATA; Schema: Personel; Owner: postgres
--

INSERT INTO "Personel"."Personel" VALUES
	(1, 'Doruk', 'KÖKLÜ', 'V', '2019-12-12 00:00:00', '05320597745', 'dorukvet@gmail.com', 'Ankara Çankaya Hilal Mahallesi'),
	(2, 'Ersin', 'KAYA', 'V', '2020-05-06 00:00:00', '05426589631', NULL, 'Ankara Çayyolu'),
	(3, 'Emre', 'SEVİLİR', 'S', '2020-12-20 00:00:00', '05412567845', NULL, 'Ankara Dikmen Konutları'),
	(4, 'Vildan', 'SAYGILI', 'V', '2017-04-19 00:00:00', '0548932156', NULL, 'Ankara Polatlı'),
	(5, 'Gökçe', 'KESER', 'S', '2020-10-12 00:00:00', '05475360454', NULL, 'Sakarya Serdivan');


--
-- Data for Name: Stajyer; Type: TABLE DATA; Schema: Personel; Owner: postgres
--

INSERT INTO "Personel"."Stajyer" VALUES
	(1, 30, NULL),
	(5, 30, NULL);


--
-- Data for Name: Veteriner; Type: TABLE DATA; Schema: Personel; Owner: postgres
--

INSERT INTO "Personel"."Veteriner" VALUES
	(1, 3950, 15, '2000-01-01 00:00:00', 'Ankara Üniversitesi'),
	(2, 4260, 15, '2010-09-14 00:00:00', 'İstanbul Üniversitesi'),
	(4, 6000, 15, '1999-08-03 00:00:00', 'Sakarya Üniversitesi');


--
-- Data for Name: Asi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Asi" VALUES
	(1, 'Lösemi Aşısı', 100),
	(2, 'Grip Aşısı', 80),
	(4, 'Kuduz', 250),
	(3, 'Karma Aşı', 400),
	(5, 'İç Parazit Aşısı', 150),
	(6, 'Dış Parazit Aşısı', 150),
	(7, 'Coronavirüs', 600);


--
-- Data for Name: AsiDegisikligiIzle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AsiDegisikligiIzle" VALUES
	(1, 7, 120, 600, '2020-12-30 12:03:04.635548');


--
-- Data for Name: Fatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Fatura" VALUES
	(1, NULL, 550, NULL, 1, NULL),
	(5, NULL, 1400, NULL, 5, NULL),
	(4, NULL, 600, NULL, 4, NULL),
	(3, NULL, 1000, NULL, 3, NULL),
	(6, NULL, 1050, NULL, 6, NULL),
	(2, NULL, 1600, NULL, 2, NULL);


--
-- Data for Name: Hayvan; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Hayvan" VALUES
	(3, 3, 'Candy', 1, 2, 40, 2, 'd'),
	(6, 6, 'Geveze', 1, 6, 35, 1, 'e'),
	(7, 7, 'Zeus', 1, 8, NULL, 1, 'e'),
	(2, 2, 'Çakıl', 3, 4, 39, 2, 'e'),
	(4, 4, 'Keyif', NULL, 7, 38, 4, 'e'),
	(5, 5, 'Gofret', 2, 1, 38, 4, 'd'),
	(1, 1, 'Kahve', 1, 3, 39, 1, 'd'),
	(13, 10, 'Neşe', 1, 2, 40, 2, 'd');


--
-- Data for Name: HayvanAsiOlma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HayvanAsiOlma" VALUES
	(1, 1, 1),
	(2, 1, 2),
	(4, 3, 3),
	(3, 1, 4);


--
-- Data for Name: HayvanCinsi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HayvanCinsi" VALUES
	(1, 'Ankara Kedisi', 1),
	(2, 'Chinchilla', 1),
	(3, 'Golden ', 2),
	(4, 'İngiliz Cocker', 2),
	(5, 'Muhabbet Kuşu', 3),
	(6, 'Papağan', 3),
	(7, 'Toy Poodle', 2),
	(8, 'Rottweiller', 2);


--
-- Data for Name: HayvanMuayneYapma; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: HayvanSahip; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HayvanSahip" VALUES
	(1, 'Kaan', 'YILDIRIM', '05320564259', 'Ankara Haymana'),
	(2, 'Kayra', 'OKUR', '05426985635', 'Ankara Kırkonaklar'),
	(3, 'Şeyma', 'SUBAŞI', '02125634598', 'İstanbul bebek'),
	(4, 'Melih', 'Abuaf', '0547856922', 'İstanbul Kadıköy'),
	(5, 'Pelin', 'BAYNAZOĞLU', '05641265785', 'Kütahya Merkez cami Karşısı'),
	(6, 'Serdar', 'Özdemir', '05412569625', 'Ankara Kızılay'),
	(7, 'Şükrü', 'Eğilmez', '05320596525', 'Ankara çankaya turan güneş'),
	(10, 'Ahmet', 'Yetenekli', '05458426445', 'Ankara');


--
-- Data for Name: HayvanSemptom; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HayvanSemptom" VALUES
	(1, 5, 1, 4),
	(2, 6, 2, 30),
	(3, 9, 3, 2),
	(5, 10, 4, 3),
	(4, 1, 3, 2),
	(6, 4, 5, 6);


--
-- Data for Name: HayvanTedaviOlma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HayvanTedaviOlma" VALUES
	(1, 1, 9, NULL),
	(2, 2, 5, NULL),
	(3, 3, 11, NULL),
	(4, 3, 12, NULL),
	(5, 4, 13, NULL),
	(6, 5, 14, NULL);


--
-- Data for Name: HayvanTeshisYapma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HayvanTeshisYapma" VALUES
	(1, 7, 1, NULL),
	(2, 7, 2, NULL),
	(3, 6, 3, NULL),
	(4, 4, 3, NULL),
	(6, 3, 5, NULL),
	(5, 8, 4, NULL);


--
-- Data for Name: HayvanTestYapma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HayvanTestYapma" VALUES
	(1, 1, 1, NULL),
	(2, 2, 1, NULL),
	(3, 3, 1, NULL),
	(4, 3, 4, NULL),
	(5, 3, 6, NULL),
	(6, 4, 7, NULL),
	(7, 5, 8, NULL),
	(8, 6, 3, NULL),
	(9, 5, 1, NULL),
	(14, 2, 1, NULL),
	(15, 6, 3, NULL);


--
-- Data for Name: HayvanTuru; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HayvanTuru" VALUES
	(1, 'Kedi'),
	(2, 'Köpek'),
	(3, 'Kuş');


--
-- Data for Name: Ilac; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ilac" VALUES
	(1, 1, ' sabah aksam '),
	(2, 2, 'sabah'),
	(5, 6, 'kus yemine toz halinde karıştırın'),
	(4, 4, 'YasMama içine katın karıştırın her gün 1 doz'),
	(3, 9, 'her  öğlen su içtiği kaba 1 doz karıştırın ');


--
-- Data for Name: IlacTur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."IlacTur" VALUES
	(1, 'Kedi İlacı  1', 25, 50),
	(2, 'Kedi İlacı 2', 50, 100),
	(3, 'Kedi İlacı 3', 75, 150),
	(4, 'Kopek İlacı 4 ', 100, 100),
	(5, 'Kopek İlacı 5', 500, 500),
	(6, 'Kus İlacı 1', 10, 30),
	(8, 'Kus İlacı 3', 15, 50),
	(9, 'Antibiyotik', 50, 100),
	(7, 'Kus İlacı 2', 5, 150);


--
-- Data for Name: IlacTurDegisikligiIzle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."IlacTurDegisikligiIzle" VALUES
	(1, 7, 20, 150, '2020-12-30 12:21:49.480089');


--
-- Data for Name: Muayne; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Muayne" VALUES
	(1, NULL, 1),
	(2, NULL, 2),
	(3, NULL, 3),
	(4, NULL, 4),
	(5, NULL, 5),
	(6, NULL, 6),
	(7, NULL, 7);


--
-- Data for Name: MuayneTuru; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."MuayneTuru" VALUES
	(1, 'Göz Muaynesi'),
	(2, 'Kulak Muaynesi'),
	(3, 'Ağız Muaynesi'),
	(4, 'Tırnak Muaynesi'),
	(5, 'Mide Muaynesi'),
	(6, 'Karın Muaynesi'),
	(7, 'Bağırsak Muaynesi');


--
-- Data for Name: Randevu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Randevu" VALUES
	(1, '2020-12-12', '13:50:00', 1),
	(2, '2020-11-15', '14:40:00', 2),
	(3, '2020-12-25', '16:50:00', 3),
	(4, '2020-12-23', '17:00:00', 4),
	(5, '2020-12-16', '09:00:00', 5),
	(6, '2020-09-06', '11:00:00', 6);


--
-- Data for Name: Recete; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Recete" VALUES
	(1, 1, NULL, NULL),
	(2, 2, NULL, NULL),
	(3, 3, NULL, NULL),
	(4, 4, NULL, NULL),
	(5, 5, NULL, NULL);


--
-- Data for Name: ReceteIlacBulundurma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ReceteIlacBulundurma" VALUES
	(1, 1, 1),
	(2, 3, 3),
	(3, 4, 4);


--
-- Data for Name: Semptom; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Semptom" VALUES
	(1, 'Ateş', NULL),
	(2, 'Kilo Kaybı', NULL),
	(3, 'İştahsızlık', NULL),
	(4, 'Kabızlık', NULL),
	(5, 'Salya Akıntısı', NULL),
	(6, 'Kepek', NULL),
	(7, 'Pire', NULL),
	(8, 'İshal', NULL),
	(9, 'Titreme', NULL),
	(10, 'Göz Akıntısı', NULL),
	(11, 'Huysuzluk', NULL),
	(12, 'Hırçınlık', NULL),
	(13, 'Agresifleşme', NULL),
	(14, 'yorgunluk', NULL),
	(15, 'inleme', NULL),
	(16, 'hırıltı', NULL),
	(17, 'kusma', NULL),
	(18, 'kan çıkışı', NULL);


--
-- Data for Name: Tedavi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tedavi" VALUES
	(1, 6, 'alt vücut genel'),
	(2, 6, 'orta vücut genel'),
	(3, 6, 'arka vücut genel'),
	(5, 1, 'ense sıvısı'),
	(4, 14, 'gaga uzunluk ayarlama'),
	(6, 7, 'kabızlık'),
	(7, 7, 'ameliyat öncesi iç temizlik'),
	(8, 15, 'göz pınarı temizliği+ göz çapak temizliği'),
	(9, 11, 'tartarlar temizlendi '),
	(10, 11, 'diş etleri kanaması giderildi'),
	(11, 16, 'ateşlenmeye karşı ilk müdahele olarak soğuk su ile yıkandı'),
	(12, 14, 'antibiyotik ihtiyacı anlaşıldı'),
	(13, 8, 'mide sondası yapılmalı fakat hasatanın midesi fazla hassas'),
	(14, 6, 'Genel tedavi ile birlikte orta genel bakım');


--
-- Data for Name: TedaviTuru; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TedaviTuru" VALUES
	(1, 'Lokal Temizlik', 200),
	(9, 'Pansuman Uygulama', 65),
	(8, 'Mide Sondası', 140),
	(7, 'Lavman', 105),
	(6, 'Genel Tedavi', 200),
	(5, 'Mideden Yabancı Cisim çıkarma', 1200),
	(4, 'Kulaktan Yabancı Cisim Çıkarma', 140),
	(3, 'Burundan Yabancı Cisim Çıkarma', 140),
	(2, 'Yara Temizliği', 65),
	(14, 'Diğer', NULL),
	(10, 'Diş Çekimi', 200),
	(11, 'Ağız Temizliği', 80),
	(12, 'Deri Temizliği', 50),
	(13, 'Tırnak Kesimi', 20),
	(15, 'Göz Temizlik', 50),
	(16, 'SoğukSu', 10);


--
-- Data for Name: Teshis; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Teshis" VALUES
	(1, 'Kanda mikrop', NULL),
	(2, 'deride lezyon', NULL),
	(3, 'mide asit dengesizliği', NULL),
	(4, 'FIB virüsü', NULL),
	(5, 'FIV virüsü', NULL),
	(6, 'Direnç düşüklüğü', NULL),
	(7, 'vitamin eksikliği', NULL),
	(8, 'gözde mikrop', NULL);


--
-- Data for Name: Test; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Test" VALUES
	(1, 'Tam Kan Sayımı(Hemogram)
', 100),
	(2, 'Serum Biyokimyası', 100),
	(3, 'İdrar Testleri', 150),
	(4, 'Hormon Analizleri', 200),
	(5, 'Patolojik İnceleme', 1000),
	(6, 'Dışkı Muayenesi ve Testleri', 250),
	(7, 'Deri Kazıntısı İncelemesi', 350),
	(8, 'Ağız Salya İnceleme Testi', 120),
	(9, 'deneme', 600);


--
-- Data for Name: TestDegisikligiIzle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TestDegisikligiIzle" VALUES
	(1, 9, 100, 500, '2020-12-30 11:53:18.811098'),
	(2, 9, 500, 600, '2020-12-30 11:55:19.551216');


--
-- Name: Personel_personelNo_seq; Type: SEQUENCE SET; Schema: Personel; Owner: postgres
--

SELECT pg_catalog.setval('"Personel"."Personel_personelNo_seq"', 5, true);


--
-- Name: AsiDegisikligiIzle_kayitNo1_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AsiDegisikligiIzle_kayitNo1_seq"', 1, true);


--
-- Name: Fatura_faturaNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Fatura_faturaNo_seq"', 23, true);


--
-- Name: HayvanAsiOlma_hayvanAsiNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HayvanAsiOlma_hayvanAsiNo_seq"', 5, true);


--
-- Name: HayvanCinsi_cinsNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HayvanCinsi_cinsNo_seq"', 8, true);


--
-- Name: HayvanMuayneYapma_hayvanMuayneNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HayvanMuayneYapma_hayvanMuayneNo_seq"', 1, false);


--
-- Name: HayvanSahip_sahipNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HayvanSahip_sahipNo_seq"', 10, true);


--
-- Name: HayvanSemptom_hayvanSemptomNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HayvanSemptom_hayvanSemptomNo_seq"', 6, true);


--
-- Name: HayvanTedaviOlma_hayvanTedaviNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HayvanTedaviOlma_hayvanTedaviNo_seq"', 6, true);


--
-- Name: HayvanTeshisYapma_hayvanTeshisNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HayvanTeshisYapma_hayvanTeshisNo_seq"', 6, true);


--
-- Name: HayvanTestYapma_hayvanTestNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HayvanTestYapma_hayvanTestNo_seq"', 29, true);


--
-- Name: Hayvan_hayvanNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Hayvan_hayvanNo_seq"', 13, true);


--
-- Name: IlacTurDegisikligiIzle_kayitNo1_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."IlacTurDegisikligiIzle_kayitNo1_seq"', 1, true);


--
-- Name: Ilac_ilacNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ilac_ilacNo_seq"', 5, true);


--
-- Name: Muayne_muayneNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Muayne_muayneNo_seq"', 7, true);


--
-- Name: Randevu_randevuNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Randevu_randevuNo_seq"', 6, true);


--
-- Name: ReceteIlacBulundurma_receteIlacNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ReceteIlacBulundurma_receteIlacNo_seq"', 4, true);


--
-- Name: Recete_receteNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Recete_receteNo_seq"', 5, true);


--
-- Name: Semptom_semptomNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Semptom_semptomNo_seq"', 18, true);


--
-- Name: Tedavi_tedaviNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tedavi_tedaviNo_seq"', 10, true);


--
-- Name: Teshis_teshisNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Teshis_teshisNo_seq"', 8, true);


--
-- Name: TestDegisikligiIzle_kayitNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TestDegisikligiIzle_kayitNo_seq"', 2, true);


--
-- Name: Personel personelPK; Type: CONSTRAINT; Schema: Personel; Owner: postgres
--

ALTER TABLE ONLY "Personel"."Personel"
    ADD CONSTRAINT "personelPK" PRIMARY KEY ("personelNo");


--
-- Name: Stajyer stajyerPK; Type: CONSTRAINT; Schema: Personel; Owner: postgres
--

ALTER TABLE ONLY "Personel"."Stajyer"
    ADD CONSTRAINT "stajyerPK" PRIMARY KEY ("personelNo");


--
-- Name: Veteriner veterinerPK; Type: CONSTRAINT; Schema: Personel; Owner: postgres
--

ALTER TABLE ONLY "Personel"."Veteriner"
    ADD CONSTRAINT "veterinerPK" PRIMARY KEY ("personelNo");


--
-- Name: TestDegisikligiIzle PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TestDegisikligiIzle"
    ADD CONSTRAINT "PK" PRIMARY KEY ("kayitNo");


--
-- Name: AsiDegisikligiIzle PKAsi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AsiDegisikligiIzle"
    ADD CONSTRAINT "PKAsi" PRIMARY KEY ("kayitNo1");


--
-- Name: IlacTurDegisikligiIzle PKIlacTur; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IlacTurDegisikligiIzle"
    ADD CONSTRAINT "PKIlacTur" PRIMARY KEY ("kayitNo1");


--
-- Name: Asi asiPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asi"
    ADD CONSTRAINT "asiPK" PRIMARY KEY ("asiNo");


--
-- Name: Fatura faturaPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fatura"
    ADD CONSTRAINT "faturaPK" PRIMARY KEY ("faturaNo");


--
-- Name: HayvanAsiOlma hayvanAsiOlmaPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanAsiOlma"
    ADD CONSTRAINT "hayvanAsiOlmaPK" PRIMARY KEY ("hayvanAsiNo");


--
-- Name: HayvanCinsi hayvanCinsiPk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanCinsi"
    ADD CONSTRAINT "hayvanCinsiPk" PRIMARY KEY ("cinsNo");


--
-- Name: Hayvan hayvanPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hayvan"
    ADD CONSTRAINT "hayvanPK" PRIMARY KEY ("hayvanNo");


--
-- Name: HayvanSahip hayvanSahipPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanSahip"
    ADD CONSTRAINT "hayvanSahipPK" PRIMARY KEY ("sahipNo");


--
-- Name: HayvanSemptom hayvanSemptomPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanSemptom"
    ADD CONSTRAINT "hayvanSemptomPK" PRIMARY KEY ("hayvanSemptomNo");


--
-- Name: HayvanTedaviOlma hayvanTedaviOlmaPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTedaviOlma"
    ADD CONSTRAINT "hayvanTedaviOlmaPK" PRIMARY KEY ("hayvanTedaviNo");


--
-- Name: HayvanTeshisYapma hayvanTeshisYapmaPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTeshisYapma"
    ADD CONSTRAINT "hayvanTeshisYapmaPK" PRIMARY KEY ("hayvanTeshisNo");


--
-- Name: HayvanTestYapma hayvanTestYapmaPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTestYapma"
    ADD CONSTRAINT "hayvanTestYapmaPK" PRIMARY KEY ("hayvanTestNo");


--
-- Name: HayvanTuru hayvanTuruPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTuru"
    ADD CONSTRAINT "hayvanTuruPK" PRIMARY KEY ("turNo");


--
-- Name: Ilac ilacPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilac"
    ADD CONSTRAINT "ilacPK" PRIMARY KEY ("ilacNo");


--
-- Name: IlacTur ilacTurPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IlacTur"
    ADD CONSTRAINT "ilacTurPK" PRIMARY KEY ("turNo");


--
-- Name: Muayne muaynePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Muayne"
    ADD CONSTRAINT "muaynePK" PRIMARY KEY ("muayneNo");


--
-- Name: MuayneTuru muayneTuruPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MuayneTuru"
    ADD CONSTRAINT "muayneTuruPK" PRIMARY KEY ("turNo");


--
-- Name: Randevu randevuPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Randevu"
    ADD CONSTRAINT "randevuPK" PRIMARY KEY ("randevuNo");


--
-- Name: ReceteIlacBulundurma receteIlacBulundurmaPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceteIlacBulundurma"
    ADD CONSTRAINT "receteIlacBulundurmaPK" PRIMARY KEY ("receteIlacNo");


--
-- Name: Recete recetePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recete"
    ADD CONSTRAINT "recetePK" PRIMARY KEY ("receteNo");


--
-- Name: Semptom semptomPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Semptom"
    ADD CONSTRAINT "semptomPK" PRIMARY KEY ("semptomNo");


--
-- Name: Tedavi tedaviPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tedavi"
    ADD CONSTRAINT "tedaviPK" PRIMARY KEY ("tedaviNo");


--
-- Name: TedaviTuru tedaviTuruPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TedaviTuru"
    ADD CONSTRAINT "tedaviTuruPK" PRIMARY KEY ("turNo");


--
-- Name: Teshis teshisPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Teshis"
    ADD CONSTRAINT "teshisPK" PRIMARY KEY ("teshisNo");


--
-- Name: Test testPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Test"
    ADD CONSTRAINT "testPK" PRIMARY KEY ("testNo");


--
-- Name: HayvanMuayneYapma unique_HayvanMuayneYapma_hayvanMuayneNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanMuayneYapma"
    ADD CONSTRAINT "unique_HayvanMuayneYapma_hayvanMuayneNo" UNIQUE ("hayvanMuayneNo");


--
-- Name: HayvanSemptom unique_HayvanSemptom_semptomNO; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanSemptom"
    ADD CONSTRAINT "unique_HayvanSemptom_semptomNO" UNIQUE ("semptomNo");


--
-- Name: Asi AsiUcretiDegistiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "AsiUcretiDegistiginde" BEFORE UPDATE ON public."Asi" FOR EACH ROW EXECUTE FUNCTION public."asiDegisikligiTR1"();


--
-- Name: IlacTur IlacTurUcretiDegistiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "IlacTurUcretiDegistiginde" BEFORE UPDATE ON public."IlacTur" FOR EACH ROW EXECUTE FUNCTION public."ilacTurDegisikligiTR1"();


--
-- Name: Test testUcretiDegistiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "testUcretiDegistiginde" BEFORE UPDATE ON public."Test" FOR EACH ROW EXECUTE FUNCTION public."testDegisikligiTR1"();


--
-- Name: HayvanTestYapma testtrigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER testtrigger AFTER INSERT ON public."HayvanTestYapma" FOR EACH ROW EXECUTE FUNCTION public.test1();


--
-- Name: HayvanTestYapma testtriggersilme; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER testtriggersilme AFTER DELETE ON public."HayvanTestYapma" FOR EACH ROW EXECUTE FUNCTION public.testsilme();


--
-- Name: Stajyer StajyerPersonel; Type: FK CONSTRAINT; Schema: Personel; Owner: postgres
--

ALTER TABLE ONLY "Personel"."Stajyer"
    ADD CONSTRAINT "StajyerPersonel" FOREIGN KEY ("personelNo") REFERENCES "Personel"."Personel"("personelNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Veteriner VeterinerPersonel; Type: FK CONSTRAINT; Schema: Personel; Owner: postgres
--

ALTER TABLE ONLY "Personel"."Veteriner"
    ADD CONSTRAINT "VeterinerPersonel" FOREIGN KEY ("personelNo") REFERENCES "Personel"."Personel"("personelNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HayvanAsiOlma HayvanAsiOlmaFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanAsiOlma"
    ADD CONSTRAINT "HayvanAsiOlmaFK" FOREIGN KEY ("asiNo") REFERENCES public."Asi"("asiNo");


--
-- Name: HayvanAsiOlma HayvanAsiOlmaFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanAsiOlma"
    ADD CONSTRAINT "HayvanAsiOlmaFK1" FOREIGN KEY ("hayvanNo") REFERENCES public."Hayvan"("hayvanNo");


--
-- Name: Hayvan HayvanFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hayvan"
    ADD CONSTRAINT "HayvanFK1" FOREIGN KEY ("veterinerNo") REFERENCES "Personel"."Veteriner"("personelNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HayvanMuayneYapma HayvanMuayneFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanMuayneYapma"
    ADD CONSTRAINT "HayvanMuayneFK" FOREIGN KEY ("muayneNo") REFERENCES public."Muayne"("muayneNo");


--
-- Name: HayvanMuayneYapma HayvanMuayneFK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanMuayneYapma"
    ADD CONSTRAINT "HayvanMuayneFK2" FOREIGN KEY ("hayvanNo") REFERENCES public."Hayvan"("hayvanNo");


--
-- Name: Muayne MuayneFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Muayne"
    ADD CONSTRAINT "MuayneFK" FOREIGN KEY ("turNo") REFERENCES public."MuayneTuru"("turNo");


--
-- Name: Randevu RandevuFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Randevu"
    ADD CONSTRAINT "RandevuFK" FOREIGN KEY ("hayvanNo") REFERENCES public."Hayvan"("hayvanNo");


--
-- Name: HayvanCinsi hayvanCinsiFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanCinsi"
    ADD CONSTRAINT "hayvanCinsiFK" FOREIGN KEY ("turNo") REFERENCES public."HayvanTuru"("turNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Hayvan hayvanFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hayvan"
    ADD CONSTRAINT "hayvanFK" FOREIGN KEY ("cinsNo") REFERENCES public."HayvanCinsi"("cinsNo");


--
-- Name: Hayvan hayvanSahipFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hayvan"
    ADD CONSTRAINT "hayvanSahipFK" FOREIGN KEY ("sahipNo") REFERENCES public."HayvanSahip"("sahipNo");


--
-- Name: HayvanSemptom hayvanSemptomFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanSemptom"
    ADD CONSTRAINT "hayvanSemptomFK" FOREIGN KEY ("hayvanNo") REFERENCES public."Hayvan"("hayvanNo");


--
-- Name: HayvanSemptom hayvanSemptomFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanSemptom"
    ADD CONSTRAINT "hayvanSemptomFK1" FOREIGN KEY ("semptomNo") REFERENCES public."Semptom"("semptomNo");


--
-- Name: HayvanTedaviOlma hayvanTedaviOlmaFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTedaviOlma"
    ADD CONSTRAINT "hayvanTedaviOlmaFK" FOREIGN KEY ("hayvanNo") REFERENCES public."Hayvan"("hayvanNo");


--
-- Name: HayvanTedaviOlma hayvanTedaviOlmaFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTedaviOlma"
    ADD CONSTRAINT "hayvanTedaviOlmaFK1" FOREIGN KEY ("tedaviNo") REFERENCES public."Tedavi"("tedaviNo");


--
-- Name: HayvanTeshisYapma hayvanTeshisYapmaFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTeshisYapma"
    ADD CONSTRAINT "hayvanTeshisYapmaFK" FOREIGN KEY ("teshisNo") REFERENCES public."Teshis"("teshisNo");


--
-- Name: HayvanTeshisYapma hayvanTeshisYapmaFK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTeshisYapma"
    ADD CONSTRAINT "hayvanTeshisYapmaFK2" FOREIGN KEY ("hayvanNo") REFERENCES public."Hayvan"("hayvanNo") ON DELETE CASCADE;


--
-- Name: HayvanTestYapma hayvanTestYapmaFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTestYapma"
    ADD CONSTRAINT "hayvanTestYapmaFK1" FOREIGN KEY ("testNo") REFERENCES public."Test"("testNo");


--
-- Name: HayvanTestYapma hayvanTestYapmaFK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HayvanTestYapma"
    ADD CONSTRAINT "hayvanTestYapmaFK2" FOREIGN KEY ("hayvanNo") REFERENCES public."Hayvan"("hayvanNo");


--
-- Name: Ilac ilacFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilac"
    ADD CONSTRAINT "ilacFK1" FOREIGN KEY ("turNo") REFERENCES public."IlacTur"("turNo");


--
-- Name: ReceteIlacBulundurma receteIlacBulundurmaFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceteIlacBulundurma"
    ADD CONSTRAINT "receteIlacBulundurmaFK" FOREIGN KEY ("ilacNo") REFERENCES public."Ilac"("ilacNo");


--
-- Name: ReceteIlacBulundurma receteIlacBulundurmaFK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceteIlacBulundurma"
    ADD CONSTRAINT "receteIlacBulundurmaFK2" FOREIGN KEY ("receteNo") REFERENCES public."Recete"("receteNo");


--
-- Name: Tedavi tedaviFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tedavi"
    ADD CONSTRAINT "tedaviFK" FOREIGN KEY ("turNo") REFERENCES public."TedaviTuru"("turNo");


--
-- PostgreSQL database dump complete
--

