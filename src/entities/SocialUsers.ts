import { Column, Entity, Index, OneToMany } from "typeorm";
import { SocialUserBiLevel } from "./SocialUserBiLevel";

@Index("users_pkey", ["id"], { unique: true })
@Index("users_key", ["id"], { unique: true })
@Entity("social_users", { schema: "public" })
export class SocialUsers {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    default: () => "now()",
  })
  createdAt: Date;

  @Column("timestamp without time zone", {
    name: "updated_at",
    default: () => "now()",
  })
  updatedAt: Date;

  @Column("boolean", { name: "deleted_flg", default: () => "false" })
  deletedFlg: boolean;

  @Column("text", { name: "user_code" })
  userCode: string;

  @Column("text", { name: "name" })
  name: string;

  @Column("text", { name: "pr", nullable: true })
  pr: string | null;

  @Column("text", { name: "avatar_uri", nullable: true })
  avatarUri: string | null;

  @Column("text", { name: "qrcode_uri", nullable: true })
  qrcodeUri: string | null;

  @Column("text", { name: "phone" })
  phone: string;

  @Column("text", { name: "email", nullable: true })
  email: string | null;

  @Column("date", { name: "birthday", nullable: true })
  birthday: string | null;

  @Column("text", { name: "address", nullable: true })
  address: string | null;

  @Column("smallint", { name: "gender", nullable: true })
  gender: number | null;

  @Column("smallint", { name: "status", default: () => "1" })
  status: number;

  @Column("jsonb", { name: "social_accounts", nullable: true })
  socialAccounts: object | null;

  @Column("text", { name: "avatar_uri_temp", nullable: true })
  avatarUriTemp: string | null;

  @Column("integer", { name: "province_id", nullable: true })
  provinceId: number | null;

  @Column("integer", { name: "district_id", nullable: true })
  districtId: number | null;

  @OneToMany(
    () => SocialUserBiLevel,
    (socialUserBiLevel) => socialUserBiLevel.user
  )
  socialUserBiLevels: SocialUserBiLevel[];
}
